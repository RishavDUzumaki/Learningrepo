mdif :: [Int] -> Int
mdif [] = -1
mdif [x] = -1
mdif (x:xs) = max (aux x xs) (mdif xs)
 where
     aux :: Int -> [Int] -> Int
     aux i [] = -1
     aux i (x:xs) = max (aux i xs) (x-i)
myscanr :: (a->b->b) -> b -> [a] -> [b]
myscanr f v l = foldr (gen f v) [] l
 where
     gen :: (a->b->b) -> b ->(a->[b]->[b])
     gen g c  = (\d lis -> if null lis then (g d c):lis   else (g d (head lis)):lis)
myscanl :: (b->a->b) -> b -> [a] -> [b]
myscanl f v l = foldl (gen f v) [] l
 where
     gen :: (b->a->b) -> b ->([b]->a->[b])
     gen g c  = (\lis d -> if null lis then (g c d):lis   else lis++[(g (last lis) d)])