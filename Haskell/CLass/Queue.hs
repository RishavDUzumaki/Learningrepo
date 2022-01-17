module Queue (Queue,enqueue,dequeue,empty,isEmpty,fromList,toList) where
data Queue a = Queue [a] [a] deriving Eq
instance Show a => Show (Queue a) where
    show (Queue xs ys) = "{" ++ show (toList (Queue xs ys)) ++ "}"
enqueue :: a -> Queue a -> Queue a
enqueue x (Queue f b) = (Queue f (x:b))
dequeue :: Queue a -> (a,Queue a)
dequeue (Queue [] [])= error "not not"
dequeue (Queue [] b)= dequeue (Queue (reverse b) [])
dequeue (Queue f b)=((head f),(Queue (tail f) b)) 
empty = Queue [] []
fromList :: [a] -> Queue a
fromList lis = Queue lis []
toList (Queue f b) = f ++reverse b
isEmpty  :: Queue a -> Bool
isEmpty (Queue xs ys) = if (null xs && null ys) then True else False 