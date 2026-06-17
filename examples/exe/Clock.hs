module Main where

import Control.Concurrent (threadDelay)
import Control.Keymapp.Client
import Data.Colour
import Data.Colour.Names
import Data.Foldable (for_)
import Data.List ((\\))
import Data.Time.LocalTime (TimeOfDay (..), getZonedTime, localTimeOfDay, zonedTimeToLocalTime)
import Network.GRPC.Client.StreamType.CanCallRPC
import Network.GRPC.Common
import System.Posix.Signals
import UnliftIO

-- all nine digits on the left-most column
digit0 :: [[LED]]
digit0 =
  [ -- 0
    [0, 1, 2, 7, 9, 14, 16, 21, 23, 27, 28, 29]
  , -- 1
    [1, 8, 15, 22, 28]
  , -- 2
    [0, 1, 2, 9, 16, 15, 14, 21, 27, 28, 29]
  , -- 3
    [0, 1, 2, 9, 16, 15, 14, 23, 27, 28, 29]
  , -- 4
    [0, 2, 7, 9, 14, 15, 16, 23, 29]
  , -- 5
    [0, 1, 2, 7, 14, 15, 16, 23, 27, 28, 29]
  , -- 6
    [0, 1, 2, 7, 14, 15, 16, 21, 23, 27, 28, 29]
  , -- 7
    [0, 1, 2, 9, 15, 22, 28]
  , -- 8
    [0, 1, 2, 7, 9, 14, 15, 16, 21, 23, 27, 28, 29]
  , -- 9
    [0, 1, 2, 7, 9, 14, 15, 16, 23, 29]
  ]

-- all nine digits on the second column
digit1 :: [[LED]]
digit1 =
  [ -- 0
    [3, 4, 5, 10, 12, 17, 19, 24, 26, 30, 31]
  , -- 1
    [4, 11, 18, 25, 31]
  , -- 2
    [3, 4, 5, 12, 19, 18, 17, 24, 30, 31]
  , -- 3
    [3, 4, 5, 12, 19, 18, 17, 26, 30, 31]
  , -- 4
    [3, 5, 10, 12, 17, 18, 19, 26]
  , -- 5
    [3, 4, 5, 10, 17, 18, 19, 26, 30, 31]
  , -- 6
    [3, 4, 5, 10, 17, 18, 19, 24, 26, 30, 31]
  , -- 7
    [3, 4, 5, 12, 18, 25, 31]
  , -- 8
    [3, 4, 5, 10, 12, 17, 18, 19, 24, 26, 30, 31]
  , -- 9
    [3, 4, 5, 10, 12, 17, 18, 19, 26]
  ]

-- all nine digits on the third column
digit2 :: [[LED]]
digit2 =
  [ -- 0
    [37, 38, 39, 44, 46, 51, 53, 57, 59, 63, 64]
  , -- 1
    [38, 45, 52, 58, 63]
  , -- 2
    [37, 38, 39, 46, 53, 52, 51, 57, 63, 64]
  , -- 3
    [37, 38, 39, 46, 53, 52, 51, 59, 63, 64]
  , -- 4
    [37, 39, 44, 46, 51, 52, 53, 59, 64]
  , -- 5
    [37, 38, 39, 44, 51, 52, 53, 59, 63, 64]
  , -- 6
    [37, 38, 39, 44, 51, 52, 53, 57, 59, 63, 64]
  , -- 7
    [37, 38, 39, 46, 52, 58, 63]
  , -- 8
    [37, 38, 39, 44, 46, 51, 52, 53, 57, 59, 63, 64]
  , -- 9
    [37, 38, 39, 44, 46, 51, 52, 53, 59, 64]
  ]

-- all nine digits on the fourth column
digit3 :: [[LED]]
digit3 =
  [ -- 0
    [40, 41, 42, 47, 49, 54, 56, 60, 62, 65, 66, 67]
  , -- 1
    [41, 48, 55, 61, 66]
  , -- 2
    [40, 41, 42, 49, 56, 55, 54, 60, 65, 66, 67]
  , -- 3
    [40, 41, 42, 49, 56, 55, 54, 62, 65, 66, 67]
  , -- 4
    [40, 42, 47, 49, 54, 55, 56, 62, 67]
  , -- 5
    [40, 41, 42, 47, 54, 55, 56, 62, 65, 66, 67]
  , -- 6
    [40, 41, 42, 47, 54, 55, 56, 60, 62, 65, 66, 67]
  , -- 7
    [40, 41, 42, 49, 55, 61, 66]
  , -- 8
    [40, 41, 42, 47, 49, 54, 55, 56, 60, 62, 65, 66, 67]
  , -- 9
    [40, 41, 42, 47, 49, 54, 55, 56, 62, 67]
  ]

onColour :: Colour Double
onColour = white

offColour :: Colour Double
offColour = black

timeOfDayDigits :: TimeOfDay -> [LED]
timeOfDayDigits (TimeOfDay h m _) =
  let (h1, h2) = h `divMod` 10
      (m1, m2) = m `divMod` 10
  in  (digit0 !! h1)
        <> (digit1 !! h2)
        <> (digit2 !! m1)
        <> (digit3 !! m2)

printDigits :: (CanCallRPC m) => Colour Double -> [LED] -> m ()
printDigits colour digits = for_ digits $ \led -> setRGBLed led colour (Sustain 0)

printTime :: (CanCallRPC m) => Colour Double -> TimeOfDay -> m ()
printTime colour = printDigits colour . timeOfDayDigits

getTime :: (MonadIO m) => m TimeOfDay
getTime = liftIO $ localTimeOfDay . zonedTimeToLocalTime <$> getZonedTime

fade :: [Colour Double]
fade = [blend d onColour offColour | d <- [1, 0.75, 0.5, 0.25, 0]]

unsetLED :: (CanCallRPC m) => LED -> m ()
unsetLED led = do
  for_ (drop 1 fade) $ \c -> do
    liftIO $ threadDelay 50000
    setRGBLed led c (Sustain 0)

setLED :: (CanCallRPC m) => LED -> m ()
setLED led = do
  for_ (drop 1 $ reverse fade) $ \c -> do
    liftIO $ threadDelay 50000
    setRGBLed led c (Sustain 0)

printDigitsIncremental :: (CanCallRPC m, MonadUnliftIO m) => [LED] -> [LED] -> m ()
printDigitsIncremental oldDigits newDigits = do
  let digitsToUnset = oldDigits \\ newDigits
      digitsToSet = newDigits \\ oldDigits
      process (unset, False) = unsetLED unset
      process (unset, True) = setLED unset
  mapConcurrently_ process (((,False) <$> digitsToUnset) <> ((,True) <$> digitsToSet))

main :: IO ()
main = do
  server <- defaultKeymappSocket

  finish <- newTVarIO False
  let handler = do
        atomically $ writeTVar finish True
        pure ()
  installHandler keyboardSignal (Catch handler) Nothing

  runClient def server $ do
    setRGBAll offColour (Sustain 0)
    time <- getTime
    let digits = timeOfDayDigits time
    printDigits onColour digits
    let loop oldDigits = do
          shouldFinish <- readTVarIO finish
          if shouldFinish
            then do
              restoreRGBLeds
              pure ()
            else do
              liftIO $ threadDelay 1000000
              newDigits <- timeOfDayDigits <$> getTime
              printDigitsIncremental oldDigits newDigits
              loop newDigits

    loop digits
