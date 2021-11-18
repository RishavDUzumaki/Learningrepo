basec :: Int -> Int -> [Int]
basec a b
 |a<b = [a]
 |otherwise = (basec (a `div` b) b)++[a `mod` b]
bitxoraux :: [Int] -> [Int]-> [Int]
bitxoraux x [] = x
bitxoraux [] y = y
bitxoraux (x:xs) (y:ys) = (bol x y) : (bitxoraux xs ys)
 where
     bol :: Int -> Int -> Int
     bol 0 x = x
     bol 1 0 = 1
     bol 1 1 = 0
bitxor :: [Int] -> [Int]-> [Int]
bitxor x y = reverse(bitxoraux (reverse x) (reverse y))
inv :: [Int] -> Int
inv [] = 0
inv (x:xs) = (2^(length (x:xs)-1))*x + inv xs
bxor :: Int -> Int -> Int
bxor a b = inv (bitxor ( basec a 2 ) (basec b 2))