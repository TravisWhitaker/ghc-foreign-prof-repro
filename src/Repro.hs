module Repro where

import Foreign.C.Types

repro :: CDouble -> CDouble -> CDouble
repro = atan2

foreign export ccall repro :: CDouble -> CDouble -> CDouble
