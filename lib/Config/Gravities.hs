module Config.Gravities
  (
    topLeft
  , topLeft66
  , topLeft33
  , top
  , top66
  , top33
  , topRight
  , topRight66
  , topRight33
  , left
  , left66
  , left33
  , center
  , center66
  , center33
  , right
  , right66
  , right33
  , bottomLeft
  , bottomLeft66
  , bottomLeft33
  , bottom
  , bottom66
  , bottom33
  , bottomRight
  , bottomRight66
  , bottomRight33
  ) where

import Subtle

topLeft       = gravity 0 0 50 50
topLeft66     = gravity 0 0 50 66
topLeft33     = gravity 0 0 50 33

top           = gravity 0 0 100 50
top66         = gravity 0 0 100 66
top33         = gravity 0 0 100 33

topRight      = gravity 50 0 50 50
topRight66    = gravity 50 0 50 66
topRight33    = gravity 50 0 50 33

left          = gravity 0 0 50 100
left66        = gravity 0 0 66 100
left33        = gravity 0 0 33 100

center        = gravity 0 0 100 100
center66      = gravity 17 17 66 66
center33      = gravity 33 33 33 33

right         = gravity 50 0 50 100
right66       = gravity 33 0 66 100
right33       = gravity 66 0 33 100

bottomLeft    = gravity 0 50 50 50
bottomLeft66  = gravity 0 33 50 66
bottomLeft33  = gravity 0 66 50 33

bottom        = gravity 0 50 100 50
bottom66      = gravity 0 33 100 66
bottom33      = gravity 0 66 100 33

bottomRight   = gravity 50 50 50 50
bottomRight66 = gravity 50 33 50 66
bottomRight33 = gravity 50 66 50 33
