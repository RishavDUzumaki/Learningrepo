inc :: Int -> Int
inc a = a+1 
plus :: Int -> Int -> Int
plus 0 a = a
plus a 0 = a
plus a b = inc( plus a (b-1) ) 