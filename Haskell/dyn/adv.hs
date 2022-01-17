module Main where
import Data.Array
inc :: [Integer] -> Integer
inc [] =0
inc [x] = 0
inc (x:y:ys) = if x<y then 1+inc (y:ys)  else inc (y:ys)
su :: [Integer] -> Int
su lis = length [i | i <-[1..(n-3)],(arr ! (i))<(arr ! (i+3))]

 where
     n= length lis
     arr = listArray (1,n) lis
getlis :: IO [Integer]
getlis = do 
 c <- getLine
 if c == "" 
     then return [] 
     else do 
         cs <-getlis
         return ((read c :: Integer):(cs))              
main :: IO()
main = do 
     lis <- getlis
     putStrLn (show  (inc lis,su lis))
