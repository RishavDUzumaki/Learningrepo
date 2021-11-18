rev :: [a] -> [a]
rev y = reva [] y
 where
 reva l [] = l
 reva l (x:xs) = reva (x:l) (xs)
mtake :: Integer -> [a] -> [a]
mtake x (y:ys) = if x<=0 then [] else y:(mtake (x-1) ys)
split :: Integer -> [a] -> [[a]]
split _ [] = [[],[]]
split i (x:xs)
 |i<=0 = [[],(x:xs)]
 |otherwise = [(x:ys),zs]
 where
     [ys,zs] = split (i-1) xs