import Data.List
import Queue
--HEre (m,r,n) = (9,15,30)
qu n=fromList [1..n]
mover q = let (x,qs)=(dequeue q) in enqueue x qs
eat :: Int -> Queue a -> Queue a
eat m q = snd (dequeue (iter (m-1) mover q))
iter :: Int -> (a->a) -> a -> a
iter 0 f x = x
iter n f x = f (iter (n-1) f x)
surv :: Int -> Int -> Int -> [Int] 
--input m r n 
surv m r n = sort (toList (iter r (eat m) (qu n))) 
