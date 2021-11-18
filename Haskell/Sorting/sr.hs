insert :: Ord a => a->[a] -> [a]
insert v [] = [v]
insert v (x:xs) = if v<=x then (v:x:xs) else x:(insert v xs)
isort :: Ord a => [a] -> [a]
isort [x] = [x]
isort (x:xs) = insert x (isort xs)
merge :: Ord a => [a] -> [a] -> [a]
merge [] l = l
merge l [] = l
merge (x:xs) (y:ys) = if x<=y then x:(merge xs (y:ys)) else y:(merge (x:xs) ys)
msort :: Ord a => [a] -> [a]
msort [] =[]
msort [x] =[x]
msort l = merge (msort fr) (msort bc)
 where 
     n= length l
     (fr,bc) = splitAt (n `div` 2) l
qsort :: Ord a => [a] -> [a]
qsort []=[]
qsort [x] = [x] 
qsort (x:xs) = (qsort (bc)) ++ [x] ++ (qsort (fr))
 where
     fr  = [ y| y <- xs , y>x]
     bc = [ y | y<- xs , y<=x]
run :: Ord a => [a] -> [a]
run [] = []
run [x] = [x]
run (x:y:zs) = if x<=y then x:(run (y:zs)) else y:(run (x:zs))
bsort :: Ord a => [a] -> [a]
bsort [] = []
bsort [x] = [x]
bsort l = iter run (length l) l
 where 
     iter :: (a->a) -> Int -> a ->a
     iter f 0 x =x
     iter f i x = f ( iter f (i-1) x)
minrun ::Ord a=> [a] ->[a] 
minrun [] = []
minrun [x] = [x]
minrun lis = swap 0 (index (minimum lis) lis) lis
 where
     swap :: Int -> Int -> [a] -> [a]
     swap i j l = repl j (l!!i) (repl i (l!!j) l)
     repl :: Int -> a ->[a] -> [a]
     repl 0 v (x:xs) = (v:xs)
     repl i v (x:xs) = x:(repl (i-1) v xs)
     index :: Eq a=> a -> [a] -> Int
     index u []  = 0
     index u (x:xs) =if x==u then 0 else 1+(index u xs) 
ssort :: Ord a => [a] -> [a]
ssort [] = []
ssort [x] = [x]
ssort (x:xs) = (head u) : (ssort (tail u)) 
 where
     u = minrun (x:xs)