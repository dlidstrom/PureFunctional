import qualified Data.Map as Map

phoneBook =
    [("betty", "555-2938")
    ,("bonnie", "452-2928")
    ,("bonnie", "452-2929")
    ,("patsy", "493-2928")
    ,("lucille", "205-2928")
    ,("wendy", "939-8282")
    ,("penny", "853-2492")]

phoneBookToMap :: (Ord k) => [(k, a)] -> Map.Map k [a]
phoneBookToMap xs = Map.fromListWith (++) $ map (\(k, v) -> (k, [v])) xs
