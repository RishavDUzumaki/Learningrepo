module Main where

import System.IO ( hSetBuffering, stdout, BufferMode(NoBuffering) )

useless :: Int -> ()
useless _ = ()



inAndOut :: IO ()
inAndOut = do 
    putStrLn "Hello! Enter your name!"
    userName <- getLine 
    putStrLn $ userName ++ "! The 200th Virahanka number is: " 
                        ++ show (fibs!!200) where 
                            fibs = 0:1:zipWith (+) fibs (tail fibs) 

myGetLine :: IO String 
myGetLine = do 
    c <- getChar 
    if c == '\n' 
        then return ""
        else do 
            cs <- myGetLine 
            return (c:cs) 
            
ntimes :: Int -> IO () -> IO ()
ntimes 0 _ = return ()
ntimes n a = do 
    a 
    ntimes (n-1) a 

tenTimesUseless :: IO ()
tenTimesUseless = ntimes 10 (do 
    inp <- myGetLine 
    putStrLn $ reverse inp)

-- this is a function (action) that has a side effect
-- Return value is not significant ... represented by ()
main :: IO ()
main = do
    hSetBuffering stdout NoBuffering 
    putStr "Who's your favourite player? "
    n <- myGetLine 
    go 100 n where 
        go 0 n = return ()  
        go i n = do 
            putStrLn n 
            go (i-1) n 