import Data.List
import Data.Array
per :: Integer -> Bool 
per n = n==(sum [i | i<-[1..(n-1)],n `mod` i == 0])
nextper :: Integer -> Integer
nextper n = if per (n+1) then (n+1) else nextper (n+1)
partitioned :: [Int] -> Bool
partitioned lis = aux 0
 where
     n =length lis
     aux i =if i>=n then False else if partition i then True else aux (i+1)
     partition :: Int -> Bool
     partition i = (foldr (\m bo ->(m<=x) && bo) True f) && (foldr (\m bo ->(m>x) && bo) True b) where (f,(x:b)) = splitAt i lis
connected :: [String] -> Bool
connected l = (connecteda l) && (nodup l) 
connecteda :: [String] -> Bool
connecteda [] = True
connecteda [x] = True
connecteda  (x:y:xs) = (con x y) && (connecteda (y:xs))
con :: String -> String ->Bool
con [] [] = True
con [] _ = False
con _ [] = False
con (x:xs) (y:ys) = if x==y then con xs ys else xs==ys
nodup ::(Eq a)=>[a] -> Bool
nodup lis = reverse lis == dupel lis
dupel ::(Eq a) => [a] -> [a]
dupel l = aux [] l
 where
     aux li [] = li
     aux li (x:xs) = if x `elem` li then aux li xs else aux (x:li) xs 
segments :: [a] -> [[a]]
segments = foldr (\a (y:ys) -> (a:y):(y:ys)) [[]]
--Partitions Code
part :: Int -> [[Int]]
part k = parts ! k
 where 
     f 0 = [[]]
     f 1 = [[1]]
     f n = concat [map ((:) i) (filter (\l -> ((null l) || (i<=head l))) (parts ! (n-i))) | i<-[1..n]]
     parts = listArray (0,k) [f i | i <- [0..k]] 
llsg :: [Int] -> Int
llsg [] = 0
llsg (x:xs) = max (lisg (x:xs)) (llsg xs)
lisg :: [Int] -> Int
lisg [] = 0
lisg [x] =1
lisg (x:xs) = aux  x xs
 where
     aux i [] =0
     aux i [x] = 1
     aux i (y:ys) = if i<=y then 1+aux (i+y) (ys) else 0
isnext :: String -> String -> Bool
isnext s1 s2
 |is 'b' s1 = (is 'a' s2) && ((length s2)== (length s1 +1))
 |otherwise = let (a1,a2)=(aux1 s1 s2,aux2 s1 s2) in (if (null a1) || (null a2) then False else (if (head a1 == 'a') && (head a2 == 'b')  then is 'b' (tail a1) && is 'a' (tail a2) && ((length a1) == (length a2))  else False))
 where
     is :: Char -> String -> Bool
     is _ [] =True
     is x (y:ys) = (x==y) && (is x ys)
     aux1 :: String -> String -> String
     aux1 t [] = t
     aux1 [] t = []
     aux1 (z:zs) (w:ws) = if z==w then (aux1 zs ws) else (z:zs)
     aux2 :: String -> String -> String
     aux2 t [] = []
     aux2 [] t = t
     aux2 (z:zs) (w:ws) = if z==w then (aux2 zs ws) else (w:ws)
data BTree = Leaf Int | Fork BTree BTree deriving (Show,Eq)
data DBTree = DLeaf Int | DFork DBTree (Int,Int) DBTree deriving (Show,Eq)
decorate :: BTree -> DBTree
decorate (Leaf n ) = (DLeaf n)
decorate (Fork l r) = (DFork (decorate l) (mint (Fork l r) , maxt (Fork l r)) (decorate r))
 where
     mint :: BTree -> Int
     mint (Leaf n) = n
     mint (Fork l r) = min (mint l)  (mint r)
     maxt :: BTree -> Int
     maxt (Leaf n) = n
     maxt (Fork l r) = max (maxt l)  (maxt r) 
bt1 = (Fork (Fork (Leaf 1) (Leaf 5)) (Fork (Leaf 6) (Leaf 2)))
type Val  = [[Int]]
data Matrix = Matrix {numRows :: Int , numCols :: Int , entries :: Val}
isValid :: Matrix -> Bool
isValid (Matrix n m l) = (n>0 && m>0)  && (length l==n) && (foldr (\lis b -> (length lis == m) && b) True l)
