mylast:: [Int] -> Int
mylast [] = 0
mylast [x] = x
mylast (x:ys) = mylast ys