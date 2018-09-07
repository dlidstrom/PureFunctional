-- data Person = Person String String Int Float String String
--     deriving (Show)

data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     , height :: Float
                     , phoneNumber :: String
                     , flavor :: String } deriving (Show, Read, Eq)

mikeD = Person { firstName = "Michael"
               , lastName = "Diamond"
               , age = 43
               , height = 183
               , phoneNumber = "123-4567"
               , flavor = "Vanilla"
               }

adRock = Person { firstName = "Adam"
                , lastName = "Horovitz"
                , age = 41
                , height = 179
                , phoneNumber = "123-4568"
                , flavor = "Raspberry"
                }

mca = Person { firstName = "Adam"
             , lastName = "Yauch"
             , age = 44
             , height = 181
             , phoneNumber = "123-4568"
             , flavor = "Chocolate"
             }

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
    deriving (Eq, Ord, Show, Read, Bounded, Enum)
