intlog :: Int -> Int -> Int
intlog k a
 | k <= a = 1 + intlog k ( div a k )
 | otherwise = 0 
pow :: Int -> Int -> Int
pow a b
 | b==0 = 1
 | otherwise = a * ( pow a ( b-1 ) )
rev :: Int -> Int
rev a
 | a < 10 = a
 | otherwise = ( pow 10 ( intlog 10 a ) ) * ( mod a 10 ) + rev ( div a 10 )