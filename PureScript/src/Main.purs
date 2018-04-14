module Main where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, logShow)
import Math (sqrt, pi)

diagonal :: Number -> Number -> Number
diagonal w h = sqrt (w * w + h * h)

circleArea :: Number -> Number
circleArea r = pi * r * r

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = logShow (diagonal 3.0 4.0)

doubleMe :: forall x. Semiring x => x -> x
doubleMe x = x + x

doubleUs :: Int -> Int -> Int
doubleUs x y = x * 2 + y * 2

doubleSmallNumber :: Int -> Int
doubleSmallNumber x = if x > 100
    then x
    else x * 2

doubleSmallNumber' :: Int -> Int
doubleSmallNumber' x = (if x > 100 then x else x * 2) + 1
