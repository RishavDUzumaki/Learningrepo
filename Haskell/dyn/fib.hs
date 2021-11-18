fibnaive :: Int -> Integer
fibnaive 0 = 0
fibnaive 1 = 1
fibnaive n = fibnaive (n-1) + fibnaive (n-2)
fib :: Int -> Integer
fib n = go (0,1) n
 where
     go (a,b) 0 = a
     go (a,b) n = go (b,(a+b)) (n-1)
fibfancy ::  Int -> Integer
fibfancy = (!!) fibs
fibs = 0:1:(zipWith (+) fibs (tail fibs) )