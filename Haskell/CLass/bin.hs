import Data.List
data BTree a = Nil | Node (BTree a) a (BTree a) deriving (Eq,Ord)
instance (Show a) => Show (BTree a) where
    show t = intercalate "\n" (draw2 t)
draw :: (Show a)=> (BTree a) -> [String]
draw Nil = ["*"]
draw (Node Nil x Nil) = [show x]
draw (Node l x r) = [show x] ++ shift (draw l) ++ shift (draw r)
shift = map (\c -> "  " ++ c)
draw2 :: (Show a)=> (BTree a) -> [String]
draw2 Nil = ["*"]
draw2 (Node Nil x Nil) = [show x]
draw2 (Node l x r) = [show x] ++ shiftl (draw2 l) ++ shiftr (draw2 r)
shiftl = zipWith (++) ("+-":repeat "| ")
shiftr = zipWith (++) ("`-":repeat "  ")
size :: BTree a-> Int
size Nil = 0
size (Node t1 u t2) = size t1 + size t2  +1
height :: BTree a-> Int
height (Node t1 u t2) = (max (height t1) (height t2))+1
reflect :: BTree a -> BTree a
reflect (Node t1 u t2) =(Node (reflect t2) u (reflect t1))
levels :: BTree a -> [a]
levels Nil = []
levels tree = concat (level' tree)
level' :: BTree a -> [[a]]
level' (Node t1 u t2) = [u]:(join (level' t1) (level' t2))
join :: [[a]] -> [[a]] -> [[a]]
join (x:xs) [] = (x:xs)
join [] (y:ys) = (y:ys)
join (x:xs) (y:ys) = (x++y):(join xs ys)
crtree::[a] ->BTree a
crtree [] = Nil
crtree lis = Node (crtree f) x (crtree b)
 where
     m = ((length lis) `div` 2)
     (f,(x:b)) = splitAt m lis
 --Traversal of atree is a walk through a tree vivssiting each elemnt exactly once
 --inorder - visit left sbtree then root then right subtree
 --postorder -lstree first then rstree then root
 --preorder - root first then lstree then rstree
inorder , preorder , postorder :: BTree a -> [a]
inorder Nil = []
inorder (Node l x r) = (inorder l) ++ [x] ++ ( inorder r) 
preorder Nil = []
preorder (Node l x r) = [x] ++ (inorder l) ++ ( inorder r)
postorder (Node l x r) = (inorder l) ++ ( inorder r) ++ [x]
crtreea ::Int -> [a] -> BTree a 
crtreea _ [] = Nil
crtreea n lis = Node (crtreea m l) x (crtreea m r)
 where  
     m=(n `div` 2)
     (l,(x:r)) = (splitAt m lis) 
crtree1 l = crtreea (length l) l
isbal::BTree a->Bool
isbal Nil=True
isbal (Node l x r) = (isbal l) && (isbal r) && ((abs ((height l) -(height r)))<=1)