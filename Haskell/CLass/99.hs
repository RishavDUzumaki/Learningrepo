insertat :: a -> [a] -> Int -> [a]
insertat v [] i = if i==1 then [v] else error " No rank preesnt!!" 
insertat v (x:xs) 1 = v:(x:xs)
insertat v (x:xs) i = if i<=0 then error "Your input sucks!!" else x:(insertat v xs (i-1))
choose :: Int -> [a] -> [[a]]
choose 0 _ = [[]]
choose _ [] =[]
choose i (x:xs) =(map ((:) x) (choose (i-1)  xs))++(choose i xs) 
per :: [a] -> [[a]]
per [] = [[]]
per (x:xs) = concat (map (insert x) (per xs))
 where 
     insert :: a -> [a] -> [[a]]
     insert x lis = [insertat x lis i | i <- [1..((length lis) +1)]]
--check :: String -> Bool
sep :: Char -> String -> [String]
sep v [] = []
sep v [x] =if x==v then [] else [[x]]
sep v (x:y:xs) = if x==v then sep v (y:xs) else if y==v then [x]:(sep v xs) else (x:head (sep v (y:xs))):(tail (sep v (y:xs)))
mgcd :: Int -> Int -> Int
mgcd a b 
 |a>b = mgcd b a
 |otherwise = if b `mod` a == 0 then a else (mgcd (b `mod` a) a)
mlcm :: Int -> Int -> Int
mlcm a b = (a*b) `div` (mgcd a b) 
pack ::(Eq a) => [a] -> [[a]]
pack [] = []
pack [x] = [[x]]
pack (x:y:zs) = if x==y then (x:(head (pack (y:zs)))):(tail (pack (y:zs))) else [x]:(pack (y:zs))
encode :: (Eq a)=> [a] -> [(Int,a)]
encode [] = []
encode [x] = [(1,x)]
encode (x:y:zs) = let (i,d)=head (encode (y:zs)) in if x==y then (i+1,d):(tail(encode (y:zs))) else (1,x):(encode (y:zs))
data NestedList a = Elem a | List [NestedList a]
flatten :: NestedList a -> [a]
flatten (Elem x) = [x]
flatten (List []) = []
flatten (List (y:ys)) = flatten y ++ flatten (List ys)
compress :: (Eq a) => [a] -> [a]
compress [] = []
compress [x] = [x]
compress (x:y:zs) = if x==y then compress (y:zs) else x:(compress (y:zs))
data Mult = Single | Multiple Int deriving (Eq,Show)
encodem :: (Eq a) => [a] -> [(Mult,a)]
encodem [] = []
encodem [x] = [(Single,x)]
encodem (x:y:zs) = let (i,d)=head (encodem (y:zs)) in if x==y then if i==Single then (Multiple 2,d):(tail(encodem (y:zs))) else (Multiple (m i + 1),d):(tail(encodem (y:zs)))  else (Single,x):(encodem (y:zs))
 where
     m (Multiple x) = x
decodem :: [(Mult,a)] -> [a]
decodem = foldr f [] 
 where
     f (Single,x) xs = (x:xs)
     f (Multiple i , x) xs = (replicate i x) ++ xs
mygetl :: IO String
mygetl = do
    c <- getChar
    if c=='\n'
        then return [] 
        else do
            cs<-mygetl
            return (c:cs)
primes  = seive [2..]
 where
     seive (x:xs) = x:[y | y<-seive xs, (y `mod` x ) /= 0]
frac :: Int -> [Int]
frac 1 = []
frac n = (p n):(frac (n `div` (p n)))
 where
     p n = aux primes n
     aux (x:xs) i = if (i `mod` x) == 0 then x else (aux xs i)
multp ::(Eq a)=> [a] -> [(Int,a)]
multp [] = []
multp (x:xs) = (freq x (x:xs) , x):(multp mxs)
 where 
     freq _ [] = 0
     freq v (y:ys) = if v==y then 1+(freq v ys) else (freq v ys)
     mxs = [v | v<-xs , v /= x] 