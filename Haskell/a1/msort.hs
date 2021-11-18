merge :: [Int] -> [Int] ->[Int]
merge a [] = a
merge [] b = b
merge (x:xs) (y:ys)= merge (aux (x:xs) y) ys
 where
     aux :: [Int] -> Int -> [Int]
     aux [] a = [a]
     aux (x:xs) a = if a<x then a:(x:xs) else x:(aux xs a) 
iselem ::Eq a => a -> [a] -> Bool
iselem x [] = False
iselem x (y:ys) = ((x == y) || (iselem x ys))
dup :: [Int] -> [Int]
dup [] =  []
dup (x:xs) = if (iselem x xs) then dup(xs) else x:dup(xs)
mergeset :: [Int] -> [Int] -> [Int]
mergeset a b = dup (merge a b)
sort :: [Int] -> [Int]
sort []= []
sort [x] = [x]
sort (x:xs) = merge [x] xs