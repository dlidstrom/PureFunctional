module Baby where

import Prelude(($), (/), bind, pure)

calcBmis xs = do
    bmi <- w / h ^ 2
    guard $ bmi > 25.0
    pure $ Tuple w h
