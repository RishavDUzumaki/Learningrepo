data Nat = Zero | Succ Nat deriving (Eq,Ord)
instance Show Nat where
    show = show .  toInt
isZero :: Nat -> Bool
isZero Zero = True
isZero _ = False
plus :: Nat ->  Nat -> Nat
plus m Zero = m
plus m (Succ n) = Succ (plus m n)
toInt :: Nat -> Int
toInt Zero = 0
toInt (Succ n) = 1+ (toInt n)
fromInt :: Int -> Nat
fromInt n
 |n<0 = error "Negative!!"
 |n==0 = Zero
 |otherwise = (Succ (fromInt (n-1)))