myinit:: [Int] -> [Int]
myinit [x] = []
myinit (x:ys) = x:(myinit ys)