module Test.Main where

import Prelude
import Baby (calcBmi)
import Effect (Effect)
import Test.Unit (suite, test)
import Test.Unit.Main (runTest)
import Test.Unit.Assert as Assert

main :: Effect Unit
main = runTest do
  suite "Some test suite" do
    test "Some test" do
      Assert.assert "2 + 2 should equal 4" $ (2 + 2) == 4
  suite "Baby" do
    test "calcBmi" do
      let bmi = calcBmi 100.0 2.0
      Assert.equal 25.0 bmi
