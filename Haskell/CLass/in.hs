import Data.Array
ini :: [a] -> [[a]]
ini lis = aux (listArray (0,(n-1)) lis)
 where
     n = length lis
     takearr i arr = [(arr ! j) | j<-[0..(i-1)]] -- complexity O(i)
     aux arr = [takearr k arr | k<-[0..n]] --complexity O(n^2)
lcs :: (Eq a) => [a] -> [a] -> Int
lcs a b = (tab !!(m))!!(n)
 where
     m = length a
     n = length b
--row i = 0:[lcs (drop (n-i) (x:xs)) (drop (m-j) (y:ys)) |j<-[1..m]] 
--lcs i j = if a!!(n-i) == b!!(n-j) then 1 + (tab !!(i-1))!!(j-1) else max ((tab !!(i))!!(j-1)) ((tab !!(i-1))!!(j))
     tab = (replicate (n+1) 0):[0:[if a!!(m-i) == b!!(n-j) then 1 + (tab !!(i-1))!!(j-1) else max ((tab !!(i))!!(j-1)) ((tab !!(i-1))!!(j))|j<-[1..n]]| i<-[1..m]]