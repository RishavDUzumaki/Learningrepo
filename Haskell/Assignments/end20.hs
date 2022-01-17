bin :: Int -> [Int]
bin 1 = [1]
bin n = (bin (n `div`2)) ++ [n `mod` 2]
dy :: Int -> [Int]
dy 1=[1]
dy 2 = [2]
dy n = (dy ((n-aux n) `div`2))++[aux n]
 where
     aux n = if n `mod` 2 ==0 then 2 else 1 