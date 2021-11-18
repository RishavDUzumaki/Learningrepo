maxnum :: [Int] -> Int
maxnum [x] = x
maxnum (x:xs) = mmax x (maxnum xs)
 where
     mmax :: Int -> Int -> Int
     mmax x y = if x>y then x else y