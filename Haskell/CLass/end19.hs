inits :: [a] -> [[a]]
inits [] = [[]]
inits (x:xs) = ([]):(map ((:) x) (inits xs))
tails :: [a] -> [[a]]
tails [] = [[]]
tails (x:xs) = (x:xs):(tails xs)
ini :: [a] -> [[a]]
ini w = reverse (foldl f [[]]  w)
 where
     f (x:xs) y = (x++[y]):(x:xs)
firstRep :: String -> Maybe Char
firstRep "" = Nothing
firstRep (x:xs) = if x `elem` xs then (Just x) else firstRep xs