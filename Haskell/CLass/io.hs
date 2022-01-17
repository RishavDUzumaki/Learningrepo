import System.Random
ioreplicate :: Int -> IO() -> IO()
ioreplicate 0 _ = return ()
ioreplicate n a = do
    a 
    ioreplicate (n-1) a
readrev :: IO()
readrev = do
    putStrLn "Enter what to reverse !! -: "
    a<-getLine
    putStrLn (reverse a)
tenrev :: IO()
tenrev = ioreplicate 10 readrev