aux :: String -> String -> Bool
aux "" a = True
aux b "" = False
aux (x:xs) (y:ys) = (x==y) && aux (xs) (ys)
sub :: String -> String -> Bool
sub "" a = True
sub b "" = False
sub (x:xs) (y:ys) = if (x==y) then (aux xs ys ||sub (x:xs) ys) else sub (x:xs) ys