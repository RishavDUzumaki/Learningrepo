arraux :: Int -> [Int] -> [Int]
arraux 1 l = l
arraux i (x:y:ys)
 |x>y = y:(arraux (i-1) (x:ys))
 |otherwise  = x:(arraux (i-1) (y:ys))
sortaux :: Int ->Int->[Int]->[Int]
sortaux i j l
 |i==j = arraux i l
 |otherwise = arraux i (sortaux (i+1) j l)
sort :: [Int] -> [Int]
sort [] = []
sort [x] = [x]
sort l = sortaux 1 (length l) l