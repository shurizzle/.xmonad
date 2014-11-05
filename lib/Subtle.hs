module Subtle
  (
    gravity
  -- main
  , subtle
  ) where

import XMonad
import XMonad.Hooks.ManageHelpers ( doRectFloat, isFullscreen, doFullFloat )
import qualified XMonad.StackSet as W
import Data.Ratio ( (%) )

import XMonad.Layout.SimplestFloat
import XMonad.Actions.WindowNavigation

gravity :: Integer -> Integer -> Integer -> Integer -> ManageHook
gravity x y w h = doRectFloat $ W.RationalRect (x%100) (y%100) (w%100) (h%100)

subtleManageHook = composeAll
    [ isFullscreen --> doFullFloat ]

replaceDefaults defaults = defaults { layoutHook = simplestFloat
                                    , manageHook = subtleManageHook }

subtle defaults = do
    config <- withWindowNavigation (xK_Up, xK_Left, xK_Down, xK_Right)
            $ replaceDefaults defaults
    xmonad config
