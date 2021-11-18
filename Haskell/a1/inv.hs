invaux :: Int -> [Int] -> Int
invaux x [] = 0
invaux x (y:ys) = if y<x then 1+(invaux x ys) else (invaux x ys)
inv :: [Int] -> Int
inv [] = 0
inv (x:xs) = invaux x (xs) + inv (xs)