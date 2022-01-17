import Data.Char
data Meme = Meme
instance Show Meme
 where
     show Meme = show1 Meme
show1 :: Meme -> String
show1 Meme = let ev =(do putStrLn ("╭━━━━━╮" ++ "\n" ++"╰┃ ┣▇━▇" ++ "\n" ++"┃ ┃  ╰━▅╮ " ++ "\n" ++"╰┳╯ ╰━━┳╯" ++ "\n" ++"╰╮ ┳━━╯ " ++ "\n" ++"▕▔▋ ╰╮╭━╮ " ++ "\n" ++"╱▔╲▋╰━┻┻╮╲╱▔▔▔╲" ++ "\n" ++" ▏  ▔▔▔▔▔▔▔  O O┃" ++ "\n" ++"╲╱▔╲▂▂▂▂╱▔╲▂▂▂╱" ++ "\n" ++" ▏╳▕▇▇▕ ▏╳▕▇▇▕")) in ev `seq` aux ev
 where
     aux _ = ""