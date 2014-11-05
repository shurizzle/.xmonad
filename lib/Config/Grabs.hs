module Config.Grabs
  (
    (--||)
  ) where

import XMonad
import Graphics.X11.ExtraTypes.XF86
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Actions.CycleWS
import qualified Data.Map as M
import Volume

altMask       = mod1Mask
browser       = "firefox"

(.+.) :: (XConfig Layout -> [((ButtonMask, KeySym), X ())])
      -> (XConfig Layout -> [((ButtonMask, KeySym), X ())])
      -> (XConfig Layout -> [((ButtonMask, KeySym), X ())])
(.+.) f f' = (\x -> f x ++ f' x)

(--||) :: XConfig Layout -> M.Map (ButtonMask, KeySym) (X ())
(--||) = M.fromList . grabs

audioGrabs _ = [
      ((0,                       xF86XK_AudioLowerVolume), io $ changeVolumeBy "default" "Master" (-1))
    , ((0,                       xF86XK_AudioRaiseVolume), io $ changeVolumeBy "default" "Master" 1)
    , ((0,                       xF86XK_AudioMute       ), io $ toggleMute "default" "Master")
    , ((0,                       xF86XK_AudioPlay       ), spawn "[ \"$(mocp -i | grep \'^State\' | cut -c8-)\" = STOP ] && mocp -p || mocp -G")
    , ((0,                       xF86XK_AudioNext       ), spawn "mocp -f")
    , ((0,                       xF86XK_AudioPrev       ), spawn "mocp -r")
    , ((0,                       xF86XK_AudioStop       ), spawn "mocp -s")
    , ((0,                       xF86XK_HomePage        ), spawn browser)
  ]

baseGrabs (XConfig { XMonad.modMask = modm }) = [
      ((altMask,                 xK_F2   ), shellPrompt defaultXPConfig)
    , ((altMask .|. controlMask, xK_Left ), prevWS)
    , ((altMask .|. controlMask, xK_Right), nextWS)
  ]

spawnGrabs conf@(XConfig { XMonad.modMask = modm }) = [
      ((modm,                    xK_Return), spawn $ XMonad.terminal conf)
    , ((modm,                    xK_ugrave), spawn "urxvt -name parsley -e /bin/sh -c 'tmux -Lparsley attach'")
    , ((modm,                    xK_plus  ), spawn "urxvt -name dev")
    , ((altMask,                 xK_l     ), spawn "slock")
    , ((altMask,                 xK_m     ), spawn "xbacklight -set 100")
    , ((modm,                    xK_q     ), spawn "xmonad --recompile && xmonad --restart")
  ]

grabs :: XConfig Layout -> [((ButtonMask, KeySym), X ())]
grabs = baseGrabs .+. spawnGrabs .+. audioGrabs
