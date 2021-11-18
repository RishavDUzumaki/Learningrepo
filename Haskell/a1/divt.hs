mdiv :: Int -> Int -> Int
mdiv a b
 |a<b = 0
 |otherwise = 1+(mdiv (a-b) b)
divt :: Int -> Int
divt a = mdiv a 2