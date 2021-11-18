mylength :: [a] -> Int
mylength l = foldr g 0 l
  where
     g :: a -> Int -> Int
     g x y = 1 + y