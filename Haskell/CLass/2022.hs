module Main where
import Data.List
two :: String -> String
two s = intercalate "\n" [m l1,m l2,m l3,m l4,m l5,m l6,m l7,m l8]
 where
     l1 = t ++ t ++ s 
     l2=t++ s ++ t ++ s
     l3= s++ t ++t ++ t ++ s
     l4 = s++ t ++t ++ t ++ s
     l5 = t++ t ++t ++ s
     l6 =t ++t ++ s
     l7 =t ++ s
     l8 = s++s++s++s++s
     m r = intercalate "\n" (replicate ((length s + 1 ) `div` 2) r)
     t= replicate (length s) ' '
zero :: String -> String
zero s = intercalate "\n" [m l1,m l2,m l3,m l4,m l5,m l6,m l7,m l8]
 where
     l1 = t ++s ++s ++s 
     l2 = s++t ++t++t++s
     l3 = s++t ++t++t++s
     l4 = s++t ++t++t++s
     l5 = s++t ++t++t++s
     l6 = s++t ++t++t++s
     l7 = s++t ++t++t++s
     l8 = t ++s ++s ++s 
     m r = intercalate "\n" (replicate ((length s + 1 ) `div` 2) r)
     t= replicate (length s) ' '
main :: IO ()
main = do 
    putStrLn ("Happy New Year!! May this new year brings peace and joy in your life!!")
    putStrLn ("Now please enter a word or your name !!")
    i<-getLine
    putStrLn (two i)
    putStrLn (concat (replicate ((length i) `div` 2) "\n"))
    putStrLn (zero i)
    putStrLn (concat (replicate ((length i) `div` 2) "\n"))
    putStrLn (two i)
    putStrLn (concat (replicate ((length i) `div` 2) "\n"))
    putStrLn (two i)
    putStrLn (concat (replicate ((length i) `div` 2) "\n"))
    putStrLn ("Press Enter to exit!!")
    u<-getLine
    putStrLn (u)