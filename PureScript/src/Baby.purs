module Baby
  (calcBmi)
    where

import Prelude ((*), (/))

--calcBmi :: Number -> Number -> Number
--calcBmi w h = do
--    let bmi = sq w / h
--    guard $ bmi > 25.0
--    pure $ Tuple w h
--    where
--        sq :: Number -> Number
--        sq x = x * x

calcBmi :: Number -> Number -> Number
calcBmi w h = w / (h * h)
