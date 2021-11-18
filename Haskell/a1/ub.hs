merge :: [Int] -> [Int] ->[Int]
merge a [] = a
merge [] b = b
merge (x:xs) (y:ys)= merge (aux (x:xs) y) ys
 where
     aux :: [Int] -> Int -> [Int]
     aux [] a = [a]
     aux (x:xs) a = if a>x then a:(x:xs) else x:(aux xs a) 
sort :: [Int] -> [Int]
sort []= []
sort [x] = [x]
sort (x:xs) = merge [x] xs
ub :: Int -> [Int] -> Int
ub a [] = -1
ub a [x] = if a<=x then x else -1
ub a (x:y:ys) = if a<=x && a>=y then x else (ub a (y:ys))
final :: Int -> [Int] -> Int
final x l = ub x (sort l)