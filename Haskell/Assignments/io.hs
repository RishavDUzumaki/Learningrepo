import Data.Array
module Main where

 fib :: Integer
    fib n = fibs ! n
     where
         f 0 = 0
         f 1 =1
         f i = fibs ! (i-1) +fibs ! (i-2)
         fibs :: Array Int Integer
         fibs = listArray (0,n) [f i | i <- [0..n]]
main :: IO ()
main =do 
    putStr "Hello  World!!"
