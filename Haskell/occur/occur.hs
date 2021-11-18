occurs :: Char -> String -> Bool
occurs c "" = False
occurs c (x:xs) = ( x==c ) || ( occurs c xs )