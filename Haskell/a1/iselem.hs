iselem ::Eq a => a -> [a] -> Bool
iselem x [] = False
iselem x (y:ys) = ((x == y) || (iselem x ys))