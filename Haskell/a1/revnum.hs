intl :: Int -> Int -> Int
intl a b
 |a<b =0
 |otherwise = 1 + intl (a `div` b) b
revnum :: Int -> Int
revnum x
 |x<10 =  x
 |otherwise = (10^(intl x 10))*(x `mod` 10) + revnum (x `div` 10)