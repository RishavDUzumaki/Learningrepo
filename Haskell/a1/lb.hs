merge :: [Int] -> [Int] ->[Int]
merge a [] = a
merge [] b = b
merge (x:xs) (y:ys)= merge (aux (x:xs) y) ys
 where
     aux :: [Int] -> Int -> [Int]
     aux [] a = [a]
     aux (x:xs) a = if a<x then a:(x:xs) else x:(aux xs a) 
sort :: [Int] -> [Int]
sort []= []
sort [x] = [x]
sort (x:xs) = merge [x] xs
lb :: Int -> [Int] -> Int
lb a [] = -1
lb a [x] = if a>=x then x else -1
lb a (x:y:ys) = if a>=x && a<=y then x else (lb a (y:ys))
final :: Int -> [Int] -> Int
final x l = lb x (sort l)