module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Math (sqrt, pi)

diagonal :: Number -> Number -> Number
diagonal w h = sqrt (w * w + h * h)

circleArea :: Number -> Number
circleArea r = pi * r * r

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

main :: Effect Unit
main = do
  log "xx" --Show (diagonal 3.0 4.0)
