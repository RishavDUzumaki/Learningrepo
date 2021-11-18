lcslen :: String -> String -> Int
lcslen a ""  = 0
lcslen "" a = 0
lcslen (x:xs) (y:ys) = if x==y then 1+(lcslen (xs) (ys)) else max (lcslen (x:xs) ys) (lcslen xs (y:ys))
lcslen1 :: String -> String -> Int
lcslen1 as bs = last(last(lcsTab))
 where
     g a b (d,u,l) = if a==b then (d+1) else max u l  
     fstRow = replicate ((length bs)+1) 0
     nxtRow a r =  0:zipWith (g a) bs (zip3 (r) (tail r) ( nxtRow a r))
     lcsTab = fstRow : zipWith nxtRow as lcsTab
 