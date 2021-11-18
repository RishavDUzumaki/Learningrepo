whitespace :: Char -> Bool
whitespace ' ' = True
whitespace '\t' = True
whitespace '\n' = True
whitespace c = False
wscount :: String -> Int
wscount "" = 0
wscount [c] = 0
wscount (a:b:bs)
 | whitespace a && not (whitespace b) = wscount (b:bs) + 1
 | otherwise = wscount (b:bs)
wordc :: String -> Int
wordc a = wscount ( ' ' : a )