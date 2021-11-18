numlen :: Integer -> Integer
numlen n 
 |n <=9 = 1
 |otherwise = 1 + numlen(n `div` 10)
rev :: Integer -> Integer
rev n
 |n <= 9 = n
 |otherwise = rev (n `div` 10) + (n `mod` 10)*(10^(numlen n - 1))
ispal :: Integer -> Bool
ispal n = (n == rev n)
gen :: Integer -> [Integer]
gen n
 |ispal n = [n]
 |otherwise = n:gen (n + rev n)