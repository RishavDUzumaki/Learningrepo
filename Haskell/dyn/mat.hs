{-data Matrix a = Mat [[a]]
instance (Show a) => Show (Matrix a)
 where
     show (Mat l) = pmatrix l-}
pmatrix ::(Show a) => [[a]] -> IO() -> String
pmatrix (x:xs) = blank(do(putStrLn (foldr (\lis str ->ref(lis) ++ "\n" ++ str ) "" (x:xs))))
 where
     ref :: (Show a)=> [a] -> String
     ref l ="|"++ foldr (\e str -> show(e) ++ " " ++  str) "|" l
     blank :: IO() -> String
     blank _ = ""