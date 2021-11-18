--class constraint Ord
{--Lists of oderable are orderable are orderable since we can compare them in dictionary wise order--}
import Data.Char
sort  ::Ord a =>  [a] -> [a]
sort [] = []
sort [x] = [x]
sort (x:xs) = sort (upper x xs) ++ [x] ++ sort (lower x xs)
 where 
     upper :: Ord a => a -> [a] -> [a]
     upper i l = [b | b <-l , b>=i] 
     lower:: Ord a => a -> [a] -> [a]
     lower i l = [b | b <-l , b<i] 
lismin :: Ord a => [a] -> Maybe a
lismin [] = Nothing
lismin (x:xs) = case lismin xs of
    Nothing -> Just x
    Just y -> Just (min x y) 
eqe :: Eq a => [a] -> [a] -> Bool
eqe [] [] = True
eqe a [] = False
eqe [] a = False
eqe (x:xs) (y:ys) = (x==y) && (eqe xs ys)
{--A string is displayed by enclosing within double quotes but what if string coontains double quotes we use \"--}
inf :: Integer -> [Integer]
inf n = (n):inf (n+1)
infList :: [Integer]
infList = inf 0
isprime :: Integer -> Bool
isprime x =([n | n<-[1..floor(fromInteger(x)**(1/2))],x `mod` n==0] )== [1]
primes :: Integer -> [Integer]
primes i= seive [2..] i
 where
     seive :: [Integer]->Integer->[Integer]
     seive  l 0 = []
     seive (x:xs) i = x:seive [t | t<-xs , t `mod` x /= 0] (i-1)
msum :: [Int] -> Int
msum = foldr (+) 0
{--
foldr :: (a->b->b)->b->[a]->b
foldr f v [] = v
foldr f v (x:xs) = f x (foldr f v xs)
    --}
mpro :: [Int] -> Int
mpro = foldr (*) 1
mlen :: [a] -> Int
mlen = foldr aux 0 
 where
     aux :: a -> Int -> Int
     aux _ b = b+1
mlen1:: [a] -> Int
mlen1 = foldr (\ _ n -> n+1) 0 
ids l = foldr (:) [] l
mre :: [a] -> [a]
mre  = foldr (\ x y -> y++[x]) []
maxa ::Ord a => [a] -> Maybe a 
maxa [] = Nothing
maxa (x:xs) = case (maxa xs) of 
    Nothing -> Just x
    Just a -> Just (a `max` x)
mfoldr1 :: (a->a->a) -> [a] -> a
mfoldr1  f [x] = x 
mfoldr1  f (x:xs) = f x (mfoldr1 f xs)
mfoldl :: (b->a->b)->b->[a]->b
mfoldl f v [] = v
mfoldl f v (x:xs) = mfoldl f (f v x) xs
strNum :: String -> Int
strNum l = foldl (\n c -> 10*n + (digitToInt c)) 0 l
dup::Eq a => [a] -> [a]
dup (x:xs) = aux [] (x:xs) where
    aux :: Eq a => [a] -> [a] ->  [a]
    aux l [] = []
    aux l (y:ys) = if y `elem` l then aux l ys else y:(aux (y:l) ys)
rev1 :: [a] -> [a]
rev1 = foldl (\lis x -> x:lis) []