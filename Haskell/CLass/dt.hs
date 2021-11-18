{--In this program we will discuss different methods to create data types and use them like crazy--}
--Type 1 - Days 
data Days = Sun|Mon|Tue|Wed|Thr|Fri|Sat
 deriving (Show, Eq , Ord)
-- function on days
wend :: Days -> Bool
wend x = if (x == Sun || x == Sat ) then True else False
nday :: Days -> Days
nday Sun = Mon
nday Mon = Tue
nday Tue = Wed
nday Wed = Thr
nday Thr = Fri
nday Fri = Sat
nday Sat = Sun
index :: Days -> Int
index Sun = 0
index Mon = 1
index Tue = 2
index Wed = 3
index Thr = 4
index Fri = 5
index Sat = 6
-- Now we will createe a fancy notation for show  rather than the silly string notation
--Stack  is Name and Stacky is wrking part that is type constructtor when we introduce in type settings we use the Stack else when real deal comes we use Stacky Like Maybe is name an Just is Working Part that is type construction
data Stack a = Stacky [a]
instance (Show a) => Show (Stack a) where 
 show (Stacky l) = printels l
printels :: (Show a )=> [a] -> String
printels [] = ""
printels [x] = show x
printels (x:xs) = show x ++ "->" ++ " " ++ (printels xs) 