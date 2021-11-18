appr :: a -> [a]-> [a]
appr v l = foldr g [v] l
  where
      g :: a -> [a] -> [a]
      g x y = x:y