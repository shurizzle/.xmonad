{-# LANGUAGE PackageImports #-}

import XMonad

import Data.Monoid

import Subtle
import Config

workspaces_   = ["main", "dev"]


onStart :: X ()
onStart = spawn ". ~/.fehbg"

main = subtle defaults

defaults = defaultConfig {
    terminal = "urxvt",
    focusFollowsMouse = True,
    borderWidth = 0,
    modMask = mod4Mask,
    workspaces = workspaces_,
    keys = (--||),
    mouseBindings = mempty,

    handleEventHook = mempty,
    logHook = return (),
    startupHook = onStart
  }
