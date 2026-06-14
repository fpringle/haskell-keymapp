module Main where

import Control.Concurrent (threadDelay)
import Control.Keymapp.Client
import Data.Colour
import Data.Colour.Names
import Data.Foldable (for_)
import Network.GRPC.Common
import UnliftIO

columns :: [[LED]]
columns =
  [ [0, 7, 14, 21, 27]
  , [1, 8, 15, 22, 28]
  , [2, 9, 16, 23, 29]
  , [3, 10, 17, 24, 30]
  , [4, 11, 18, 25, 31]
  , [5, 12, 19, 26]
  , [6, 13, 20, 33, 32, 34, 35]
  , [68, 69, 70, 36, 43, 50, 71]
  , [37, 44, 51, 57]
  , [38, 45, 52, 58, 63]
  , [39, 46, 53, 59, 64]
  , [40, 47, 54, 60, 65]
  , [41, 48, 55, 61, 66]
  , [42, 49, 56, 62, 67]
  ]

columnColours :: [Colour Double]
columnColours =
  [ red
  , red
  , orange
  , orange
  , yellow
  , yellow
  , green
  , green
  , blue
  , blue
  , indigo
  , indigo
  , violet
  , violet
  ]

ledsWithColours :: [[(LED, Colour Double)]]
ledsWithColours = [(,colour) <$> column | (column, colour) <- zip columns columnColours]

main :: IO ()
main = do
  server <- defaultKeymappSocket
  runClient def server $ do
    setRGBAll black (Sustain 0)
    setStatusLedAll (On False) (Sustain 0)

    for_ (zip columns columnColours) $ \(column, colour) -> do
      for_ column $ \led -> setRGBLed led colour (Sustain 0)
      liftIO $ threadDelay 50000
    for_ [0 .. 2] $ \led -> do
      setStatusLed led (On True) (Sustain 0)
      liftIO $ threadDelay 50000
    for_ (zip columns columnColours) $ \(column, _) -> do
      for_ column $ \led -> setRGBLed led black (Sustain 0)
      liftIO $ threadDelay 50000
    for_ [0 .. 2] $ \led -> do
      setStatusLed led (On False) (Sustain 0)
      liftIO $ threadDelay 50000

    liftIO $ threadDelay 1000000
    restoreRGBLeds
    restoreStatusLeds
    pure ()
