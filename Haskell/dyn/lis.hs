lisnaive :: (Ord a) => [a] -> Integer
lisnaive [] = 0
lisnaive [x] = 1
lisnaive (x:y:zs) = if x<=y then max (2 +lisnaive (filter (\a->a>=y) zs)) (lisnaive(x:zs)) else lisnaive (y:zs)
lis :: (Ord a) => [a] -> Integer
lis [] = 0
lis l = maximum row
 where
     n = length l
     max1 :: [Integer] -> Integer
     max1 [] = 0
     max1 (x:xs) = max x  (max1 xs)
     row = 1:[ 1+max1 (ifi (\j-> l !! (j-1) <= l !! (i-1)) ((i-1) `take` row))  | i <- [2..n]]
ifi :: (Int -> Bool) -> [a] -> [a]
ifi p l = aux n p l
 where
     n= length l
     aux i q [] = []
     aux i q (y:ys) = if q (n-i+1) then y:(aux (i-1) q (ys)) else aux (i-1) q (ys)

