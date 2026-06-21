{-# LANGUAGE ApplicativeDo #-}
{-# LANGUAGE LambdaCase #-}

module Main where

import Control.Applicative ((<**>))
import Control.Keymapp.Client
import Control.Monad (replicateM, unless)
import Control.Monad.IO.Class (liftIO)
import Data.Colour
import Data.Colour.SRGB (sRGB24reads)
import Data.Foldable (fold)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Network.GRPC.Client
import Network.GRPC.Common
import Numeric.Natural (Natural)
import qualified Options.Applicative as O
import System.Directory
import System.Exit (exitFailure)

data Command
  = GetStatus
  | GetKeyboards
  | ConnectKeyboard KeyboardId
  | ConnectAnyKeyboard
  | DisconnectKeyboard
  | SetLayer Layer
  | UnsetLayer Layer
  | SetRGBLed LED (Colour Double) Sustain
  | SetRGBAll (Colour Double) Sustain
  | RestoreRGBLeds
  | SetStatusLed LED On Sustain
  | SetStatusLedAll On Sustain
  | RestoreStatusLeds
  | IncreaseBrightness Natural
  | DecreaseBrightness Natural

getStatusP :: O.Parser Command
getStatusP = pure GetStatus

getKeyboardsP :: O.Parser Command
getKeyboardsP = pure GetKeyboards

connectKeyboardP :: O.Parser Command
connectKeyboardP =
  ConnectKeyboard
    <$> O.option (KeyboardId <$> O.auto) (O.long "index" <> O.short 'i' <> O.metavar "keyboard index")

connectAnyKeyboardP :: O.Parser Command
connectAnyKeyboardP = pure ConnectAnyKeyboard

disconnectKeyboardP :: O.Parser Command
disconnectKeyboardP = pure DisconnectKeyboard

setLayerP :: O.Parser Command
setLayerP =
  SetLayer
    <$> O.option (Layer <$> O.auto) (O.long "index" <> O.short 'i' <> O.metavar "INDEX")

unsetLayerP :: O.Parser Command
unsetLayerP =
  UnsetLayer
    <$> O.option (Layer <$> O.auto) (O.long "index" <> O.short 'i' <> O.metavar "INDEX")

setRGBLedP :: O.Parser Command
setRGBLedP =
  SetRGBLed
    <$> ledP
    <*> colourP
    <*> sustainP

colourP :: O.Parser (Colour Double)
colourP = O.option parseColour (O.long "colour" <> O.short 'c' <> O.metavar "COLOUR")
  where
    parseColour = O.eitherReader $ \s -> case sRGB24reads s of
      [(c, "")] -> pure c
      _ -> Left $ "Invalid colour: " <> show s

sustainP :: O.Parser Sustain
sustainP = Sustain <$> O.option O.auto (O.long "sustain" <> O.short 'c' <> O.metavar "SUSTAIN" <> O.value 0)

ledP :: O.Parser LED
ledP = O.option (LED <$> O.auto) (O.long "led" <> O.short 'l' <> O.metavar "LED")

onP :: O.Parser On
onP = O.flag (On True) (On False) (O.long "off" <> O.short 'o')

setRGBAllP :: O.Parser Command
setRGBAllP =
  SetRGBAll
    <$> colourP
    <*> sustainP

restoreRGBLedsP :: O.Parser Command
restoreRGBLedsP = pure RestoreRGBLeds

setStatusLedP :: O.Parser Command
setStatusLedP =
  SetStatusLed
    <$> ledP
    <*> onP
    <*> sustainP

setStatusLedAllP :: O.Parser Command
setStatusLedAllP =
  SetStatusLedAll
    <$> onP
    <*> sustainP

restoreStatusLedsP :: O.Parser Command
restoreStatusLedsP = pure RestoreStatusLeds

increaseBrightnessP :: O.Parser Command
increaseBrightnessP =
  IncreaseBrightness
    <$> stepsP

stepsP :: O.Parser Natural
stepsP = O.option O.auto (O.long "steps" <> O.short 's' <> O.metavar "STEPS" <> O.value 1)

decreaseBrightnessP :: O.Parser Command
decreaseBrightnessP =
  DecreaseBrightness
    <$> stepsP

commandP :: O.Parser Command
commandP =
  O.hsubparser
    ( O.command "status" (O.info getStatusP (O.progDesc "Get API status."))
        <> O.command "list" (O.info getKeyboardsP (O.progDesc "List all available keyboards."))
        <> O.command "connect" (O.info connectKeyboardP (O.progDesc "Connect to a keyboard given the index returned by the list command."))
        <> O.command "connect-any" (O.info connectAnyKeyboardP (O.progDesc "Connect to the first keyboard detected by keymapp."))
        <> O.command "disconnect" (O.info disconnectKeyboardP (O.progDesc "Disconnect from the currently connected keyboard."))
        <> O.command "set-layer" (O.info setLayerP (O.progDesc "Set the layer of the currently connected keyboard."))
        <> O.command "unset-layer" (O.info unsetLayerP (O.progDesc "Unset the layer of the currently connected keyboard."))
        <> O.command "set-rgb" (O.info setRGBLedP (O.progDesc "Sets the RGB color of a LED."))
        <> O.command "set-rgb-all" (O.info setRGBAllP (O.progDesc "Sets the RGB color of all LEDs."))
        <> O.command "restore-rgb-leds" (O.info restoreRGBLedsP (O.progDesc "Restores the RGB color of all LEDs to their default."))
        <> O.command "set-status-led" (O.info setStatusLedP (O.progDesc "Set / unset a status LED."))
        <> O.command "set-status-led-all" (O.info setStatusLedAllP (O.progDesc "Set / unset all status LEDs."))
        <> O.command "restore-status-leds" (O.info restoreStatusLedsP (O.progDesc "Restores all status LEDs to their default."))
        <> O.command "increase-brightness" (O.info increaseBrightnessP (O.progDesc "Increase the brightness of the keyboard's LEDs."))
        <> O.command "decrease-brightness" (O.info decreaseBrightnessP (O.progDesc "Decrease the brightness of the keyboard's LEDs."))
    )

globalOptsP :: O.Parser GlobalOptions
globalOptsP = do
  socketPath <- O.option (Path <$> O.auto) (O.long "socket-path" <> O.short 's' <> O.metavar "PATH" <> O.value DefaultPath)
  pure GlobalOptions {..}

optsP :: O.Parser Opts
optsP = do
  command <- commandP
  globalOptions <- globalOptsP
  pure Opts {..}

data SocketPath
  = DefaultPath
  | Path FilePath

mkServer :: SocketPath -> IO Server
mkServer = \case
  DefaultPath -> ServerUnix <$> getXdgDirectory XdgConfig ".keymapp/keymapp.sock"
  Path path -> pure $ ServerUnix path

newtype GlobalOptions = GlobalOptions
  { socketPath :: SocketPath
  }

data Opts = Opts
  { command :: Command
  , globalOptions :: GlobalOptions
  }

runOpts :: Opts -> IO ()
runOpts (Opts cmd GlobalOptions {..}) = do
  server <- mkServer socketPath
  Success success <- runClient def server $ case cmd of
    GetStatus -> getStatus >>= handleStatus
    GetKeyboards -> getKeyboards >>= handleKeyboards
    ConnectKeyboard keyboardId -> connectKeyboard keyboardId
    ConnectAnyKeyboard -> connectAnyKeyboard
    DisconnectKeyboard -> disconnectKeyboard
    SetLayer layer -> setLayer layer
    UnsetLayer layer -> unsetLayer layer
    SetRGBLed led colour sustain -> setRGBLed led colour sustain
    SetRGBAll colour sustain -> setRGBAll colour sustain
    RestoreRGBLeds -> restoreRGBLeds
    SetStatusLed led on sustain -> setStatusLed led on sustain
    SetStatusLedAll on sustain -> setStatusLedAll on sustain
    RestoreStatusLeds -> restoreStatusLeds
    IncreaseBrightness n -> fold <$> replicateM (fromIntegral n) increaseBrightness
    DecreaseBrightness n -> fold <$> replicateM (fromIntegral n) decreaseBrightness

  unless success $ do
    putStrLn "The Keymapp API reported a failure."
    exitFailure

printKeyboard :: Keyboard -> IO ()
printKeyboard (Keyboard (KeyboardId kId) name connected) = do
  T.putStrLn $ "- id:        " <> T.pack (show kId)
  T.putStrLn $ "  name:      " <> name
  T.putStrLn $ "  connected: " <> (if connected then "true" else "false")

handleKeyboards :: [Keyboard] -> KeymappClient IO Success
handleKeyboards keyboards = do
  liftIO $ traverse printKeyboard keyboards
  pure $ Success True

printStatus :: Status -> IO ()
printStatus (Status version connected) = do
  T.putStrLn $ "version:   " <> version
  case connected of
    Nothing -> T.putStrLn "keyboard:  none"
    Just ConnectedKeyboard {..} -> do
      let Layer layer = currentLayer
      T.putStrLn "keyboard:"
      T.putStrLn $ "  name:    " <> friendlyName
      T.putStrLn $ "  version: " <> firmwareVersion
      T.putStrLn $ "  layer:   " <> T.pack (show layer)

handleStatus :: Status -> KeymappClient IO Success
handleStatus status = do
  liftIO $ printStatus status
  pure $ Success True

main :: IO ()
main = do
  let prefs =
        O.prefs $
          O.showHelpOnEmpty
            <> O.showHelpOnError
            <> O.columns 100
            <> O.helpShowGlobals
  opts <-
    O.customExecParser prefs $
      O.info (optsP <**> O.helper) $
        O.fullDesc
          <> O.header "Call a gRPC server running the Keymapp API in order to control your ZSA keyboard."
  runOpts opts
