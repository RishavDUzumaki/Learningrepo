--IN this Program we will make foldl using foldr 
myfoldl :: (b->a->b) -> b -> [a] -> b
myfoldl f v l = foldr (flip f) v (reverse l)