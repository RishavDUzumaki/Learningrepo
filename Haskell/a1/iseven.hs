mym :: Int -> Int -> Int
mym a b
 |a<b = a
 |otherwise = mym (a-b) b
iseven :: Int -> Bool
iseven a
 |(mym a 2) == 0 = True
 |otherwise = False
