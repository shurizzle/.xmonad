{-# LANGUAGE PackageImports #-}
module Volume
  (
    changeVolumeBy
  , toggleMute
  ) where

import "alsa-mixer" Sound.ALSA.Mixer
import Control.Monad ( when )

changeVolumeBy :: String -> String -> Integer -> IO ()
changeVolumeBy mix ctrl i =
    withMixer mix $ \mixer ->
      do Just control <- getControlByName mixer ctrl
         let Just playbackVolume = playback $ volume control
         (min, max) <- getRange playbackVolume
         Just vol <- getChannel FrontLeft $ value $ playbackVolume
         when ((i > 0 && vol < max) || (i < 0 && vol > min)) $
           setChannel FrontLeft (value $ playbackVolume) $ vol + i

toggleMute :: String -> String -> IO ()
toggleMute mix ctrl =
    withMixer mix $ \mixer ->
      do Just control <- getControlByName mixer ctrl
         let Just playbackSwitch = playback $ switch control
         Just sw <- getChannel FrontLeft playbackSwitch
         setChannel FrontLeft playbackSwitch $ not sw
