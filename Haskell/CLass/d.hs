module Stack (Stack,push,pop,top,fromList,emptystack,isempty) where
--type constructors are exported value constructors are not exported if we import the value constructors then they will be able to do attach 
newtype Stack a = Stack [a]
{--data Stack = Stack [Int]--}
 deriving(Show,Eq)
--type Stack = [Int] if we use this the its just a alias
push :: a -> Stack a -> Stack a
push n (Stack st ) = Stack (n:st)
pop :: Stack a -> (Maybe a,Stack a)
pop (Stack []) = (Nothing,Stack []) 
pop (Stack lis) = (Just (head lis),Stack (tail lis))
top lis = fst (pop lis)
fromList = Stack 
emptystack = Stack []
isempty (Stack xs) = null xs
sumStack :: Num a => Stack a -> a
sumStack (Stack lis) = sum lis
attachstacks :: Stack a ->Stack a -> Stack a
attachstacks (Stack xs) (Stack ys) = Stack (xs++ys)
--I shouldnt be allowed to even attach stacks but we are first telling we cant attach then we are attaching this is sed (* <> *) but if we dont write code we cant attach

