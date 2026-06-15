{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedLabels #-}

{- | This module provides a monad for interacting with the Keymapp API, and functions for calling its
endpoints via gRPC.
-}
module Control.Keymapp.Client
  ( -- * Monad transformer
    KeymappClient
  , runClient

    -- * Core commands

    {- | These functions are more or less a one-to-one-translation from the
    [protobuf specification](https://github.com/zsa/kontroll/blob/main/proto/keymapp.proto) of the API.
    -}
  , getStatus
  , getKeyboards
  , connectKeyboard
  , connectAnyKeyboard
  , disconnectKeyboard
  , setLayer
  , unsetLayer
  , setRGBLed
  , setRGBAll
  , setStatusLed
  , increaseBrightness
  , decreaseBrightness

    -- ** Derived commands

    {- | These operations aren't defined by the Keymapp API, but are provided for convenience
    and mostly inspired by functions in [Kontroll](https://github.com/zsa/kontroll).
    -}
  , restoreRGBLeds
  , restoreStatusLeds
  , setStatusLedAll

    -- * Types
  , Keyboard (..)
  , ConnectedKeyboard (..)
  , Status (..)
  , Success (..)
  , On (..)
  , KeyboardId (..)
  , LED (..)
  , Layer (..)
  , Sustain (..)

    -- * Utils
  , defaultKeymappSocket
  )
where

import Control.Keymapp.API hiding (ConnectedKeyboard, Keyboard)
import Control.Monad.Catch (MonadCatch, MonadMask, MonadThrow)
import Control.Monad.IO.Class (MonadIO (..))
import Control.Monad.IO.Unlift (MonadUnliftIO (..))
import Control.Monad.Reader (ReaderT (..), mapReaderT)
import Data.Colour.Names (white)
import Data.Colour.SRGB
import Data.Foldable (fold)
import Data.Int (Int32)
import Data.ProtoLens.Labels ()
import Data.Semigroup (All (..))
import Data.Text (Text)
import Data.Traversable (for)
import Network.GRPC.Client (ConnParams, Connection, Server (..), rpc, withConnection)
import Network.GRPC.Client.StreamType.CanCallRPC
import Network.GRPC.Common.Protobuf
import qualified Proto.Keymapp as Proto
import System.Directory

{- | Most of the Keymapp server endpoints return a boolean success value without any additional information.

We derive 'Semigroup' and 'Monoid' instances via t'All'. In other words if we do a bunch of operations,
we define the overall operation to be a success only if all of the operations succeeded.
-}
newtype Success = Success {asBool :: Bool}
  deriving (Show, Eq)
  deriving (Semigroup, Monoid) via All

-- | Boolean newtype used by the 'setStatusLed'* functions. Indicates whether a status LED should be turned on or off.
newtype On = On {asBool :: Bool}
  deriving (Show, Eq)

-- | The ID of a keyboard, as returned by the list endpoints ('getKeyboards').
newtype KeyboardId = KeyboardId {asInt32 :: Int32}
  deriving (Show, Eq, Ord, Enum, Num)

{- | The index of an LED.

Mapping on a ZSA Moonlander MK1:

+----+----+----+----+----+----+----+---+----+----+----+----+----+----+----+
| 0  | 1  | 2  | 3  | 4  | 5  | 6  |   | 36 | 37 | 38 | 39 | 40 | 41 | 42 |
+----+----+----+----+----+----+----+---+----+----+----+----+----+----+----+
| 7  | 8  | 9  | 10 | 11 | 12 | 13 |   | 43 | 44 | 45 | 46 | 47 | 48 | 49 |
+----+----+----+----+----+----+----+---+----+----+----+----+----+----+----+
| 14 | 15 | 16 | 17 | 18 | 19 | 20 |   | 50 | 51 | 52 | 53 | 54 | 55 | 56 |
+----+----+----+----+----+----+----+---+----+----+----+----+----+----+----+
| 21 | 22 | 23 | 24 | 25 | 26 |    |   |    | 57 | 58 | 59 | 60 | 61 | 62 |
+----+----+----+----+----+----+----+---+----+----+----+----+----+----+----+
| 27 | 28 | 29 | 30 | 31 |    |    |   |    |    | 63 | 64 | 65 | 66 | 67 |
+----+----+----+----+----+----+----+---+----+----+----+----+----+----+----+
|    |    |    |    |    | 32 |    |   |    | 68 |    |    |    |    |    |
+----+----+----+----+----+----+----+---+----+----+----+----+----+----+----+
|    |    |    |    | 33 | 34 | 35 |   | 69 | 70 | 71 |    |    |    |    |
+----+----+----+----+----+----+----+---+----+----+----+----+----+----+----+
-}
newtype LED = LED {asInt32 :: Int32}
  deriving (Show, Eq, Ord, Enum, Num)

-- | The index of a layer.
newtype Layer = Layer {asInt32 :: Int32}
  deriving (Show, Eq, Ord, Enum, Num)

{- | Delay in milliseconds. This is used for most of the endpoints that change lights and colours -
if the sustain is set to 0, the change is permanent; otherwise, a sustain of X means the change will
last for X milliseconds and then revert.
-}
newtype Sustain = Sustain {asInt32 :: Int32}
  deriving (Show, Eq, Ord, Enum, Num)

-- | Details of a keyboard as returned by the 'getKeyboards' endpoint.
data Keyboard = Keyboard
  { id :: !KeyboardId
  , friendlyName :: !Text
  , isConnected :: !Bool
  }
  deriving (Show, Eq)

decodeKeyboard :: Proto Proto.Keyboard -> Keyboard
decodeKeyboard keyboard =
  Keyboard
    { id = KeyboardId $ keyboard ^. #id
    , friendlyName = keyboard ^. #friendlyName
    , isConnected = keyboard ^. #isConnected
    }

-- | Details of the connected keyboard as returned by the 'getStatus' endpoint.
data ConnectedKeyboard = ConnectedKeyboard
  { friendlyName :: !Text
  , firmwareVersion :: !Text
  , currentLayer :: !Layer
  }
  deriving (Show, Eq)

decodeConnectedKeyboard :: Proto Proto.ConnectedKeyboard -> ConnectedKeyboard
decodeConnectedKeyboard keyboard =
  ConnectedKeyboard
    { friendlyName = keyboard ^. #friendlyName
    , firmwareVersion = keyboard ^. #firmwareVersion
    , currentLayer = Layer $ keyboard ^. #currentLayer
    }

-- | Status of the API as returned by the 'getStatus' endpoint.
data Status = Status
  { keymappVersion :: !Text
  , connectedKeyboard :: !(Maybe ConnectedKeyboard)
  }
  deriving (Show, Eq)

decodeGetStatusReply :: Proto GetStatusReply -> Status
decodeGetStatusReply reply =
  Status
    { keymappVersion = reply ^. #keymappVersion
    , connectedKeyboard = decodeConnectedKeyboard <$> reply ^. #maybe'connectedKeyboard
    }

decodeGetKeyboardsReply :: Proto GetKeyboardsReply -> [Keyboard]
decodeGetKeyboardsReply reply = fmap decodeKeyboard $ reply ^. #keyboards

decodeConnectKeyboardReply :: Proto ConnectKeyboardReply -> Success
decodeConnectKeyboardReply reply = Success $ reply ^. #success

decodeDisconnectKeyboardReply :: Proto DisconnectKeyboardReply -> Success
decodeDisconnectKeyboardReply reply = Success $ reply ^. #success

decodeSetLayerReply :: Proto SetLayerReply -> Success
decodeSetLayerReply reply = Success $ reply ^. #success

decodeSetRGBLedReply :: Proto SetRGBLedReply -> Success
decodeSetRGBLedReply reply = Success $ reply ^. #success

decodeSetRGBAllReply :: Proto SetRGBAllReply -> Success
decodeSetRGBAllReply reply = Success $ reply ^. #success

decodeSetStatusLedReply :: Proto SetStatusLedReply -> Success
decodeSetStatusLedReply reply = Success $ reply ^. #success

decodeBrightnessUpdateReply :: Proto BrightnessUpdateReply -> Success
decodeBrightnessUpdateReply reply = Success $ reply ^. #success

------------------------------------------------------------

-- | Get the status of the Keymapp API, including the connected keyboard.
getStatus :: (CanCallRPC m) => m Status
getStatus = decodeGetStatusReply <$> nonStreaming (rpc @(Protobuf KeyboardService "getStatus")) defMessage

-- | List all the keyboards connected to your computer that the Keymapp server can talk to.
getKeyboards :: (CanCallRPC m) => m [Keyboard]
getKeyboards = decodeGetKeyboardsReply <$> nonStreaming (rpc @(Protobuf KeyboardService "getKeyboards")) defMessage

-- | Connect to a specific keyboard. The t'KeyboardId' is an index from the list that 'getKeyboards' returns.
connectKeyboard :: (CanCallRPC m) => KeyboardId -> m Success
connectKeyboard (KeyboardId keyboardId) = decodeConnectKeyboardReply <$> nonStreaming (rpc @(Protobuf KeyboardService "connectKeyboard")) (defMessage & #id .~ keyboardId)

-- | Connect to the first keyboard detected by the Keymapp server.
connectAnyKeyboard :: (CanCallRPC m) => m Success
connectAnyKeyboard = decodeConnectKeyboardReply <$> nonStreaming (rpc @(Protobuf KeyboardService "connectAnyKeyboard")) defMessage

-- | Disconnect from the currently connected keyboard.
disconnectKeyboard :: (CanCallRPC m) => m Success
disconnectKeyboard = decodeDisconnectKeyboardReply <$> nonStreaming (rpc @(Protobuf KeyboardService "disconnectKeyboard")) defMessage

-- | Set the layer of the currently connected keyboard.
setLayer :: (CanCallRPC m) => Layer -> m Success
setLayer (Layer layerId) = decodeSetLayerReply <$> nonStreaming (rpc @(Protobuf KeyboardService "setLayer")) (defMessage & #layer .~ layerId)

-- | Unset the layer of the currently connected keyboard.
unsetLayer :: (CanCallRPC m) => Layer -> m Success
unsetLayer (Layer layerId) = decodeSetLayerReply <$> nonStreaming (rpc @(Protobuf KeyboardService "unsetLayer")) (defMessage & #layer .~ layerId)

-- | Sets the RGB color of a LED.
setRGBLed :: (CanCallRPC m) => LED -> Colour Double -> Sustain -> m Success
setRGBLed (LED led) colour (Sustain sustain) = do
  let RGB r g b = toSRGB24 colour
  decodeSetRGBLedReply
    <$> nonStreaming
      (rpc @(Protobuf KeyboardService "setRGBLed"))
      ( defMessage
          & #led .~ led
          & #sustain .~ sustain
          & #red .~ fromIntegral r
          & #green .~ fromIntegral g
          & #blue .~ fromIntegral b
      )

-- | Sets the RGB color of all LEDs.
setRGBAll :: (CanCallRPC m) => Colour Double -> Sustain -> m Success
setRGBAll colour (Sustain sustain) = do
  let RGB r g b = toSRGB24 colour
  decodeSetRGBAllReply
    <$> nonStreaming
      (rpc @(Protobuf KeyboardService "setRGBAll"))
      ( defMessage
          & #sustain .~ sustain
          & #red .~ fromIntegral r
          & #green .~ fromIntegral g
          & #blue .~ fromIntegral b
      )

-- | Restores the RGB color of all LEDs to their default.
restoreRGBLeds :: (CanCallRPC m) => m Success
restoreRGBLeds = setRGBAll white (Sustain 1)

-- | Set / unset a status LED.
setStatusLed :: (CanCallRPC m) => LED -> On -> Sustain -> m Success
setStatusLed (LED led) (On on) (Sustain sustain) =
  decodeSetStatusLedReply
    <$> nonStreaming
      (rpc @(Protobuf KeyboardService "setStatusLed"))
      ( defMessage
          & #led .~ led
          & #on .~ on
          & #sustain .~ sustain
      )

-- | Set / unset all status LEDs.
setStatusLedAll :: (CanCallRPC m) => On -> Sustain -> m Success
setStatusLedAll on sustain =
  fmap fold . for [0 .. 2] $ \led -> setStatusLed (LED led) on sustain

-- | Restores all status LEDs to their default.
restoreStatusLeds :: (CanCallRPC m) => m Success
restoreStatusLeds = setStatusLed (LED 0) (On False) (Sustain 1)

-- | Increase the brightness of the keyboard's LEDs.
increaseBrightness :: (CanCallRPC m) => m Success
increaseBrightness = decodeBrightnessUpdateReply <$> nonStreaming (rpc @(Protobuf KeyboardService "increaseBrightness")) defMessage

-- | Decrease the brightness of the keyboard's LEDs.
decreaseBrightness :: (CanCallRPC m) => m Success
decreaseBrightness = decodeBrightnessUpdateReply <$> nonStreaming (rpc @(Protobuf KeyboardService "decreaseBrightness")) defMessage

------------------------------------------------------------
-- Monad transformer

{- | A monad transformer for calling the Keymapp API.
Basically just hides the details of the connection to the gRPC server.

TODO: catch errors?
-}
newtype KeymappClient m a = KeymappClient (ReaderT Connection m a)
  deriving newtype
    ( Functor
    , Applicative
    , Monad
    , MonadIO
    , MonadUnliftIO
    , MonadFail
    , MonadThrow
    , MonadCatch
    , MonadMask
    , CanCallRPC
    )

{- | Run a t'KeymappClient' action using gRPC connection details (see the grapesy documentation for more details).

To get the standard 'Server' details, see 'defaultKeymappSocket'.
-}
runClient :: (MonadUnliftIO m) => ConnParams -> Server -> KeymappClient m a -> m a
runClient params server (KeymappClient rma) =
  withRunInIO $ \unlift ->
    withConnection params server $
      runReaderT (mapReaderT unlift rma)

------------------------------------------------------------
-- Utils

-- | The default Keymapp server runs at @~/.config/keymapp/keymapp.socket@
defaultKeymappSocket :: (MonadIO m) => m Server
defaultKeymappSocket = liftIO $ ServerUnix <$> getXdgDirectory XdgConfig ".keymapp/keymapp.sock"
