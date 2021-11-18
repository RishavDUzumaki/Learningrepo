basec :: Int -> Int -> [Int]
basec a b
 |a<b = [a]
 |otherwise = (basec (a `div` b) b)++[a `mod` b]
bitandaux :: [Int] -> [Int]-> [Int]
bitandaux x [] = x
bitandaux [] y = y
bitandaux (x:xs) (y:ys) = (bol x y) : (bitandaux xs ys)
 where
     bol :: Int -> Int -> Int
     bol 0 x = 0
     bol 1 x = x
bitand :: [Int] -> [Int]-> [Int]
bitand x y = reverse(bitandaux (reverse x) (reverse y))
inv :: [Int] -> Int
inv [] = 0
inv (x:xs) = (2^(length (x:xs)-1))*x + inv xs
band :: Int -> Int -> Int
band a b = inv (bitand ( basec a 2 ) (basec b 2))