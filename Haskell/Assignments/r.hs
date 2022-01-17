import Data.Array
{--selectLeader :: Int -> Int -> (Int,Int,Int,[Int])
selectLeader n k = go (n-1) (n,0,1,[1..n])
--head ((\(w,x,y,z)->z) (go (n-1) (n,0,1,[1..n])))
 where
     {--inv :: (Int,[Int]) -> Int
     inv i = let 
                 f = fst i
                 s = snd i
                 u = (remove f s) 
             in u !! ((locate f s + k-1) `mod` (length u))
     rep :: (Int,[Int]) -> [Int]
     rep i =  let 
                 f = fst i
                 s = snd i
                 u = (remove f s)
             in u
     locate :: Int -> [Int] -> Int
     locate a (x:xs) = if a==x then 0 else 1+locate a xs--}
     inv :: (Int,Int,Int,[Int]) -> Int
     inv (z,f,s,t) = if z==2 then 0 else (remove s t) !! (loc (z,f,s,t))
     rep :: (Int,Int,Int,[Int]) -> [Int]
     rep (z,f,s,t) =  remove s t


     loc :: (Int,Int,Int,[Int]) -> Int
     loc (z,f,s,t) =  if z==2 then 0 else ((f  + k-1) `mod` (z-1))
     remove :: Int -> [Int] ->[Int]
     remove i [] = []
     remove i (x:xs) = if i==x then xs else x:(remove i xs)
     {--tab :: [(Int,[Int])]
     tab = (1,[1..n]):[(inv i ,rep i)| i <- [1..(n-1)]]--}
     {--arr :: Array Int (Int,[Int])
     arr = listArray (0,(n-1)) ((1,[1..n]):[(inv i ,rep i)| i <- [1..(n-1)]])--}
     go :: Int -> (Int,Int,Int,[Int]) ->(Int,Int,Int,[Int]) 
     go 0 b = b 
     go i b = go (i-1) (i,loc b,inv b , rep b)--}
selectLeader :: Int -> Int ->Int
selectLeader n k =head ((\(x,y,z)->z) (tab !! (n-1)))
 where 
     {--aux :: Int->[Int]->(Int,[Int])
     aux 0  lis = (inv 0 lis,rep 0 lis)
     aux i  lis = (inv i lis,rep i lis) 
     inv :: Int -> [Int] ->Int
     inv 0 lis = 1
     inv i lis = rep (i-1) lis !! ((locate (inv (i-1) lis) (rep (i-1) lis) + k) `mod` (length rep (i-1) lis))
     rep :: Int -> [Int]  -> [Int]
     rep 0 lis = lis
     rep i lis = remove (inv (i-1) lis) (rep (i-1) lis)--}
    {-- inv :: Int -> Int
     inv i = let 
                 (f,s,t) = arr ! (i-1)
                 u = (remove s t) 
                 (a,b,c) = arr ! (i)
             in c!! a--}
     rep :: (Int,Int,[Int])-> [Int]
     rep (z,f,t) = (remove f t)
     loc :: (Int,Int,[Int])-> Int
     loc (z,f,t) = ((f  + k-1) `mod` (z-1))
     len :: (Int,Int,[Int]) -> Int
     len (z,f,t) = (z-1)
     remove :: Int -> [Int] ->[Int]
     remove i lis = (i `take` lis) ++ ((i+1) `drop` lis)
     tab ::[(Int,Int,[Int])]
     tab = (n,0,[1..n]):map (\t ->(len t,loc t, rep t)) tab

mss :: [Int] -> Int 
mss [] =error "Empty Set "
mss lis = row !! (n-1)
--mss (x:xs)@lis = max (m1 (x:xs)) (mss xs)
 where 
     -- m1 [] =0
     --m1 (y:ys) = x^3 + max (0) (m1 ys)
     n = length lis
     u= tail (reverse lis)
     --f i  = m1 ((n-i-1) `drop` (x:xs))
     --row =(lis !! (n-1))^3:[(lis !! (n-i-1))^3 + max (0) (f (i-1))| i <- [1..(n-1)]]
     rowa= (lis !! (n-1))^3 : (zipWith (\x y -> x^3 + (max (0) y)) (u) (rowa))
     row = (lis !! (n-1))^3 : (zipWith (max) row (tail(rowa)))
lps :: Eq a => [a] -> (Int, [a])
lps [] = (0,[])
lps lis =arr0 ! (0,(n-1)) 
--if fst(l1 lis)>=(fst(lps (tail lis))) then (l1 lis) else (lps (tail(lis))) 
 where
     {--l1 [a] = (1,[a])
     l1 [] = (0,[])
     l1 (x:xs) = if x `elem` xs then ((2+ (fst (lps ((maxp x xs) `take` xs)))) ,(x:(snd (lps ((maxp x xs) `take` xs))++[x]))) else (1,[x])--}
     n = length lis
     maxp :: Eq a => a -> [a] -> Int 
     maxp i l = ((length l)-1)-(ind i (reverse l)) 
     ind :: Eq a => a -> [a] -> Int
     ind i (x:xs) = if i==x then 0 else 1+(ind i xs)
     cut i j = (i) `drop` ((j+1) `take` lis )
     l0 i j =if i>j then (0,[]) else if i==j thenif i==j then (1,[lis !! i])  else if fst(arr1 ! (i,j))>=(fst(arr0 ! (i+1,j))) then (arr1 ! (i,j)) else (arr0 ! (i+1,j))
     l1 i j = if i>j then (0,[]) else if i==j thenif i==j then (1,[lis !! i])  else let(x,xs)=((lis !! i),(cut (i+1) j)) in (if x `elem` xs then (2+fst(arr0 ! (i,(i+1 + maxp x xs))),x:snd(arr0 ! (i+1,(i + maxp x xs)))++[x]) else (1,[x]))
     arr0 = listArray ((0,0),((n-1),(n-1))) [l0 i j | i <-[0..(n-1)] , j <-[0..(n-1)]]
     arr1 = listArray ((0,0),((n-1),(n-1))) [l1  i j | i <-[0..(n-1)] , j <-[0..(n-1)]] 

