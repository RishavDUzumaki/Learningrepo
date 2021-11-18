--Program to find at what places we have a character in a string 
loc :: String -> Char-> [Int]
loc s a = aux 0 a s
 where
     aux :: Int -> Char -> String -> [Int]
     aux i c "" = []
     aux i c (x:xs) = if c==x then i:(aux (i+1) c xs) else (aux (i+1) c xs)
dupel :: String -> String
dupel s = aux [] s
 where
     aux :: String -> String -> String 
     aux l  [] = l
     aux l (x:xs) = if not (x `elem` l) then aux (l++[x]) (xs) else aux l xs
type Dat = [(Char,[Int])]
fin :: String -> Dat
fin s = foldr id [] (dupel s)
 where
     id :: Char -> Dat -> Dat 
     id x l = (x ,loc s x):l
