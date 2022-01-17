module Main where
import Data.List
main = do
    putStrLn "Hi, you are a new face I have not seen before. May I know your name?"
    putStr "My name is: "  
    name <- getLine
    putStrLn $ "Hi " ++ name ++  " , Merry Christmas! How big do you want your Christmas tree?"
    putStr "Please input a positive integer : "
    inp <- readLn :: IO Int
    putStrLn (tree inp ++( intercalate "\n" $ zipWith (++) (replicate 3 (replicate (inp-2) ' ')) ["", "| |", "| |"]) )
    putStrLn "Thank you for your patronage! Hope to see you again next year."
    putStrLn ("Press Enter to exit!!")
    u<-getLine
    putStrLn (u)
  
tree :: Int -> String
tree 1 = "*"
tree 2 = " *\n***"
tree n =  " " ++ insert' '\n' (tree (n-1)) ++  "\n" ++ replicate (2*n-1)  '*' 
 
insert' :: Char -> String -> String
insert' c [] = []
insert' c (x:xs) = if c == x 
                          then c : ' ' : insert' c xs 
                           else x : insert' c xs  
