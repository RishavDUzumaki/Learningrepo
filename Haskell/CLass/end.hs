data Dig = Zero | One | Two | Three | Four | Five| Six | Seven | Eight | Nine deriving (Eq, Ord)
data Op = Add | Sub | Mul | Div deriving (Eq, Ord)
type Exp = (Op, Dig, Dig)
a=Add
b=Sub
rev lis= foldl (flip (:)) [] lis 
myReplicate :: Int -> a -> [a]
myReplicate 0 v = []
myReplicate i v = v:(myReplicate (i-1) v)
countFalse :: [Bool] -> Int
countFalse [] = 0
countFalse (x:xs) = if x==False then 1+(countFalse xs) else (countFalse xs)
sortBools :: [Bool] -> [Bool]
sortBools ls = (myReplicate i False) ++ (myReplicate (n-i) True)
 where
     i = countFalse ls
     n = length ls
data BTree = Nil | BNode Int BTree BTree deriving Show
data Tree = Node Int [Tree] deriving Show
encodea :: [Tree] -> BTree
encodea [] = Nil
encodea [t] =(BNode (node t) (encodea (unnode t)) Nil)
encodea (t:s:trs) = (BNode (node t) (encodea (unnode t)) (encodea (s:trs)))
node (Node i l) = i
unnode (Node i l) = l  
encode :: Tree -> BTree
encode tr = encodea [tr]

tree1 = Node 1 [Node 2 [], Node 3 [Node 4 [], Node 5 [], Node 6[]],Node 7 [Node 8 []]]
decode :: BTree -> [Tree] 
decode Nil = []
decode (BNode n lis Nil) = [Node n lis]
decode (BNode n l r) = (Node n (decode l)):(decode r)