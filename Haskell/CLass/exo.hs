import Stack
data Op = Add|Sub |Mult|Div deriving Eq
instance Show Op where 
     show Add = "+"
     show Sub = "-"
     show  Mult= "*"
     show  Div= "/"
data Exp = Leaf Int | Node Exp Op Exp
instance Show Exp where
     show (Leaf n) = show n
     show (Node expl op expr ) = "("++ (show expl) ++ " "++ (show op) ++ " " ++ (show expr) ++ ")"
optofunc :: Op -> (Int -> Int->Int)
optofunc Add = (+)
optofunc Sub = (-)
optofunc Mult = (*)
optofunc Div = div
eval :: Exp ->  Int
eval (Leaf n) = n
eval (Node exp0 op expr) = (optofunc op (eval exp0) (eval expr))
exp2 = Node (Leaf 3) Add (Node (Leaf 2) Mult (Leaf 5) )
exp3 = Node (Node (Leaf 3) Mult (Leaf 5) ) (Add) (Leaf 2)
post :: Exp -> String --Converts to postfix expression 
post (Leaf n) = show n 
post (Node e1 o e2) = post e1 ++" "++ post e2 ++" "++ (show o)
--Now we need to create expression from postfix form 
--For this we wil use Stack
type Token = Either Int Op -- Eiher type description -- Either  is a data type constructor with value  constructors LEft and Right Left stands Either a b = Left a | Right b 
tokenize :: String -> Token
tokenize  "+" = Right Add
tokenize  "-" = Right Sub
tokenize  "*" = Right Mult
tokenize  "/" = Right Div
tokenize n = Left (read n :: Int)
tokl :: String -> [Token]
tokl lis =  map tokenize (split ' ' lis )
split :: Char -> String -> [String]
split c [] = []
split c [x] =[[x]]
split c (x:y:zs) = if x==c then (split c (y:zs)) else if y==c then [x]:(split c zs) else (x:(head (split c (y:zs)))) : (tail (split c (y:zs))) 
toexp :: String -> Stack Exp 
toexp lis =(foldl aux (emptystack) (tokl lis))
 where
      aux stk (Left n) = push (Leaf n) stk
      aux stk  (Right op) = let (f,s,t) = ((top stk),(top (snd (pop stk))),(snd (pop (snd (pop stk))))) in push (Node s op f) t