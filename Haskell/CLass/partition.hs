module Main where
import Data.Array
import Data.List
part :: Int -> [[Int]]
part k = parts ! k
 where 
     f 0 = [[]]
     f 1 = [[1]]
     f n = concat [map ((:) i) (filter (\l -> ((null l) || (i<=head l))) (parts ! (n-i))) | i<-[1..n]]
     parts = listArray (0,k) [f i | i <- [0..k]]
partitions :: Int -> String
partitions 0 = ""
partitions i = partitions (i-1) ++ (show i ++"  -  "++ show (length (part i)) ++ "\n")
partitions' :: Int -> String
partitions' 0 = ""
partitions' i = intercalate "\n" (map show (part i))
func = [show.length.part,partitions,partitions']

main :: IO()
main = do
    putStrLn (" 0-To get number of partitions of n \n 1-To get number of partitions uptil n \n 2-To get all partitions of n ")
    inte <- readLn :: IO Int
    putStrLn ("Enter The Number")
    num <- readLn :: IO Int
    putStrLn ((func !! inte) num)
    putStrLn ("Press enter to exit!!")
    a <- getLine
    putStrLn a