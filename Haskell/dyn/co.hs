--Coin Changes DP with infinite coins and denominations be 3,5,10
cc :: Int-> Integer
-- the input type is list of denominations then the  value to reach
cc y = (tab !! y) !! 2
 where
     zrow  = [1,1,1] 
     -- row i =((\m -> if m `mod` 3 == 0 then 1 else 0) i ):[f i,g i]
     f x = if x>=5 then ((tab !! (x-5) )!! 1) + ((tab !! x )!! 0) else ((tab !! x )!! 0) 
     g x = if x>=10 then  (tab !! (x-10) !! 2) + ((tab !! x)!! 1) else ((tab !! x)!! 1) 
     tab = zrow : [((\m -> if m `mod` 3 == 0 then 1 else 0) i ):[f i,g i]| i <-[1..]] 

ccf :: [Int]->Int ->Integer
ccf l y = (tab !! y) !! (n-1)
 where
     zrow  = replicate n 1
     n = length l
     -- row i =((\m -> if m `mod` 3 == 0 then 1 else 0) i ):[f i,g i]
     f x y = if x >= (l !! y) then ((tab !! (x-(l!!y)))!!y) + ((tab !! x)!!(y-1)) else ((tab !! x)!!(y-1))
    -- f x = if x>=5 then ((tab !! (x-5) )!! 1) + ((tab !! x )!! 0) else ((tab !! x )!! 0) 
     --g x = if x>=10 then  (tab !! (x-10) !! 2) + ((tab !! x)!! 1) else ((tab !! x)!! 1) 
     tab = zrow : [((\m -> if m `mod` (l !! 0) == 0 then 1 else 0) i ):[f i j | j <- [1..(n-1)]]| i <-[1..]] 
 