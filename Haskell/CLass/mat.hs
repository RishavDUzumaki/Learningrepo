prod :: [[Integer]] -> [[Integer]] -> [[Integer]]
prod [] _ = []
prod  (x:xs) l = (row 0 x l ):(prod (xs)  l)
 where
     j = length x
     k= length l
     row :: Int -> [Integer] -> [[Integer]] -> [Integer]
     row a (y:ys) (z:zs) = if a>=j then [] else ( (elem a 0 (y:ys) (z:zs)) :(row (a+1)  (y:ys) (z:zs)) )
     elem :: Int -> Int -> [Integer] -> [[Integer]] -> Integer
     elem a m (y:ys) (z:zs) = if m>=k then 0 else  ((y:ys) !! m )*((((z:zs) !! m))!! a)+ (elem a (m+1) (y:ys) (z:zs)) 