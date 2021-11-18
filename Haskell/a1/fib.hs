fib :: Int -> Int
fib 1 = 1
fib 2 = 1
fib a = fib (a-1) + fib (a-2)