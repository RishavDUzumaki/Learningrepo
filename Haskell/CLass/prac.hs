
pack :: [Char] -> [[Char]]
pack l = fold1 aux l
 where
     aux :: Char -> [[Char]] -> [[Char]]
     aux a (x:xs) = if head x == a then (([a]++x):xs) else ([a]:x:xs)
     fold1 :: (Char->[String]->[String]) -> [Char] -> [[Char]]
     fold1 f [x] = [[x]]
     fold1 f (y:ys) = f y (fold1 f ys)
pac2 :: [Char] -> [[Char]]
pac2 [x]=[[x]]
pac2 (x:xs) = aux x (pac2 xs)
 where
     aux :: Char -> [[Char]] -> [[Char]]
     aux a (x:xs) = if head x == a then (([a]++x):xs) else ([a]:x:xs)  
runlen::[Char] -> [(Int,Char)]
runlen [x] = [(1,x)]
runlen (x:xs) = aux x (runlen xs)
 where
     aux :: Char -> [(Int,Char)] -> [(Int,Char)]
     aux a ((x,y):xs) = if y == a then ((1+x,y):xs) else ((1,a):(x,y):xs)
func :: [Char] -> [Char]
func [x] = [x]
func (x:xs) = aux x (func xs)
 where
     aux :: Char -> [Char] -> [Char]
     aux a [] = [a]
     aux a (x:xs) = if x==a then (x:xs) else a:(x:xs)
fre :: [Int] -> [Int]
fre m = fen m m
 where
     aux :: Int ->[Int] -> Int
     aux a []= 0
     aux a  (x:xs) = if a==x then 1+aux a (xs) else aux a (xs)
     fen :: [Int] -> [Int] -> [Int]
     fen [] l = []
     fen (y:ys) l = (aux y  l) : (fen ys l)
iterl :: Int-> (a->a) -> a -> [a]
iterl 0 f x = [x]
iterl i f x = w ++ [f (last w)]
 where
     w =iterl (i-1) f x
frn :: Int -> [Int] -> [[Int]]
frn i l = iterl i fre l
checkb ::Eq a=>[a] -> Bool
checkb [x] =False
checkb [] = False
checkb (x:y:ys) = if x==y then True else checkb (y:ys)
checkr :: Int -> [Int] ->Bool
checkr i l = checkb (frn i l) 