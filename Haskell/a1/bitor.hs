basec :: Int -> Int -> [Int]
basec a b
 |a<b = [a]
 |otherwise = (basec (a `div` b) b)++[a `mod` b]
bitoraux :: [Int] -> [Int]-> [Int]
bitoraux x [] = x
bitoraux [] y = y
bitoraux (x:xs) (y:ys) = (bol x y) : (bitoraux xs ys)
 where
     bol :: Int -> Int -> Int
     bol 0 x = x
     bol 1 x = 1
bitor :: [Int] -> [Int]-> [Int]
bitor x y = reverse(bitoraux (reverse x) (reverse y))
inv :: [Int] -> Int
inv [] = 0
inv (x:xs) = (2^(length (x:xs)-1))*x + inv xs
bor :: Int -> Int -> Int
bor a b = inv (bitor ( basec a 2 ) (basec b 2))