whitespace :: Char -> Bool
whitespace ' ' = True
whitespace '\t' = True
whitespace '\n' = True
whitespace c = False
wtrack :: String -> [String]
wtrack l = foldr g [] l
 where 
     g :: Char-> [String]  ->  [String]
     g  x k
      |whitespace x = []:k
      |(not ( whitespace x ) ) && ( k == [] )= [[x]]
      |otherwise = ([x] ++ head(k)):(tail(k))
elim:: [String] -> [String]
elim l = filter h l
 where
     h:: String -> Bool
     h "" = False
     h a = True
com :: String -> [String]
com l = elim ( wtrack l )
insaux :: Int-> a -> [a] ->[a]
insaux 1 c l = c:l 
insaux i c (x:xs) = x:(insaux (i-1) c xs)
peraux ::Int->Int-> a ->[a] -> [[a]]
peraux i j v l
 |i>j = []
 |otherwise = (insaux i v l):(peraux (i+1) j v l)
paux :: a->[a] -> [[a]]
paux v l = peraux 1 (length(l)+1) v l
fold1 :: (a -> [[a]]-> [[a]]) -> [a] -> [[a]]
fold1 f [x] = [[x]]
fold1 f (x:xs) = f x (fold1 f xs)
per :: [a] -> [[a]]
per l = fold1 g l
 where
     g :: a -> [[a]] -> [[a]] 
     g i [] = []
     g i (x:xs) = (paux i x ) ++ (g i xs)
total :: String -> [[String]]
total l = per (com l)
conc1 :: [String] -> String
conc1 [] = ""
conc1 (x:xs) = x ++ " " ++ conc1 xs
gen :: [[String]] -> [String]
gen l = map conc1 l
fin :: String -> [String]
fin l = gen (total l)