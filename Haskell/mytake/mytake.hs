mytake:: Int -> [Int] -> [Int]
mytake a [] = []
mytake 0 l = []
mytake n (x:xs) = x:( mytake (n-1) xs )