{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedLabels #-}

module Control.Keymapp.Client
  ( -- * Monad transformer
    KeymappClient
  , runClient

    -- * Core commands
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
import Proto.Keymapp qualified as Proto
import System.Directory

newtype Success = Success {asBool :: Bool}
  deriving (Show, Eq)
  deriving (Semigroup, Monoid) via All

newtype On = On {asBool :: Bool}
  deriving (Show, Eq)

newtype KeyboardId = KeyboardId {asInt32 :: Int32}
  deriving (Show, Eq, Ord, Enum, Num)

newtype LED = LED {asInt32 :: Int32}
  deriving (Show, Eq, Ord, Enum, Num)

newtype Layer = Layer {asInt32 :: Int32}
  deriving (Show, Eq, Ord, Enum, Num)

-- | Delay in milliseconds
newtype Sustain = Sustain {asInt32 :: Int32}
  deriving (Show, Eq, Ord, Enum, Num)

data Keyboard = Keyboard
  { id :: KeyboardId
  , friendlyName :: Text
  , isConnected :: Bool
  }
  deriving (Show, Eq)

decodeKeyboard :: Proto Proto.Keyboard -> Keyboard
decodeKeyboard keyboard =
  Keyboard
    { id = KeyboardId $ keyboard ^. #id
    , friendlyName = keyboard ^. #friendlyName
    , isConnected = keyboard ^. #isConnected
    }

data ConnectedKeyboard = ConnectedKeyboard
  { friendlyName :: Text
  , firmwareVersion :: Text
  , currentLayer :: Layer
  }
  deriving (Show, Eq)

decodeConnectedKeyboard :: Proto Proto.ConnectedKeyboard -> ConnectedKeyboard
decodeConnectedKeyboard keyboard =
  ConnectedKeyboard
    { friendlyName = keyboard ^. #friendlyName
    , firmwareVersion = keyboard ^. #firmwareVersion
    , currentLayer = Layer $ keyboard ^. #currentLayer
    }

data Status = Status
  { keymappVersion :: Text
  , connectedKeyboard :: Maybe ConnectedKeyboard
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

getStatus :: (CanCallRPC m) => m Status
getStatus = decodeGetStatusReply <$> nonStreaming (rpc @(Protobuf KeyboardService "getStatus")) defMessage

getKeyboards :: (CanCallRPC m) => m [Keyboard]
getKeyboards = decodeGetKeyboardsReply <$> nonStreaming (rpc @(Protobuf KeyboardService "getKeyboards")) defMessage

connectKeyboard :: (CanCallRPC m) => KeyboardId -> m Success
connectKeyboard (KeyboardId keyboardId) = decodeConnectKeyboardReply <$> nonStreaming (rpc @(Protobuf KeyboardService "connectKeyboard")) (defMessage & #id .~ keyboardId)

connectAnyKeyboard :: (CanCallRPC m) => m Success
connectAnyKeyboard = decodeConnectKeyboardReply <$> nonStreaming (rpc @(Protobuf KeyboardService "connectAnyKeyboard")) defMessage

disconnectKeyboard :: (CanCallRPC m) => m Success
disconnectKeyboard = decodeDisconnectKeyboardReply <$> nonStreaming (rpc @(Protobuf KeyboardService "disconnectKeyboard")) defMessage

setLayer :: (CanCallRPC m) => Layer -> m Success
setLayer (Layer layerId) = decodeSetLayerReply <$> nonStreaming (rpc @(Protobuf KeyboardService "setLayer")) (defMessage & #layer .~ layerId)

unsetLayer :: (CanCallRPC m) => Layer -> m Success
unsetLayer (Layer layerId) = decodeSetLayerReply <$> nonStreaming (rpc @(Protobuf KeyboardService "unsetLayer")) (defMessage & #layer .~ layerId)

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

restoreRGBLeds :: (CanCallRPC m) => m Success
restoreRGBLeds = setRGBAll white (Sustain 1)

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

setStatusLedAll :: (CanCallRPC m) => On -> Sustain -> m Success
setStatusLedAll on sustain =
  fmap fold . for [0 .. 2] $ \led -> setStatusLed (LED led) on sustain

restoreStatusLeds :: (CanCallRPC m) => m Success
restoreStatusLeds = setStatusLed (LED 0) (On False) (Sustain 1)

increaseBrightness :: (CanCallRPC m) => m Success
increaseBrightness = decodeBrightnessUpdateReply <$> nonStreaming (rpc @(Protobuf KeyboardService "increaseBrightness")) defMessage

decreaseBrightness :: (CanCallRPC m) => m Success
decreaseBrightness = decodeBrightnessUpdateReply <$> nonStreaming (rpc @(Protobuf KeyboardService "decreaseBrightness")) defMessage

------------------------------------------------------------
-- Monad transformer

newtype KeymappClient m a = KeymappClient (ReaderT Connection m a)
  deriving newtype
    ( Functor
    , Applicative
    , Monad
    , MonadIO
    , MonadFail
    , MonadThrow
    , MonadCatch
    , MonadMask
    , CanCallRPC
    )

runClient :: (MonadUnliftIO m) => ConnParams -> Server -> KeymappClient m a -> m a
runClient params server (KeymappClient rma) =
  withRunInIO $ \unlift ->
    withConnection params server $
      runReaderT (mapReaderT unlift rma)

------------------------------------------------------------
-- Utils

defaultKeymappSocket :: (MonadIO m) => m Server
defaultKeymappSocket = liftIO $ ServerUnix <$> getXdgDirectory XdgConfig ".keymapp/keymapp.sock"
