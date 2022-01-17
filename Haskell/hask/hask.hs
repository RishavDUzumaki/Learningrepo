module Main where
import Data.Array
import System.IO
fib :: Integer -> Integer
fib n = (fibs ! n)
     where
         f 0 = 0
         f 1 =1
         f i = fibs ! (i-1) +fibs ! (i-2)
         fibs :: Array Integer Integer
         fibs = listArray (0,n) [f i | i <- [0..n]]
main :: IO()
main = do 
    hSetBuffering stdout NoBuffering
    putStrLn ("Enter the number whose fib u want!!")
    n <- getLine
    putStrLn (show (fib (read n :: Integer)))