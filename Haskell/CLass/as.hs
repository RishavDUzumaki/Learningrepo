data BTree = Nil | Node BTree Int BTree deriving (Eq,Show)
inorder , preorder , postorder :: BTree -> [Int]
inorder Nil = []
inorder (Node l x r) = (inorder l) ++ [x] ++ ( inorder r) 
preorder Nil = []
preorder (Node l x r) = [x] ++ (inorder l) ++ ( inorder r)
postorder (Node l x r) = (inorder l) ++ ( inorder r) ++ [x]
into :: [Int] -> [Int] -> Maybe BTree
into [] [] = Just Nil
into [] _ = Nothing
into _ [] = Nothing
into (x:xs) (y:ys) = if (i==(-1))||(l == (Nothing))||(r == (Nothing)) then Nothing else Just (Node (j l) x (j r)) 
 where
     i = (index x (y:ys)) 
     (a,b) =(splitAt (i) xs) 
     (c,e:d) = (splitAt i (y:ys)) 
     l =(into a c)
     r = (into b d)
     j (Just u) = u 
     index :: (Eq a) => a -> [a] -> Int
     index _ [] = -1
     index v (z:zs) = let n =(index v zs) in if z==v then 0 else if (n==(-1)) then -1 else (1+n)
data Color = Red | Black
 deriving (Eq,Show ,Ord)
data RBTree a = RBNil | RBNode (RBTree a) a Color (RBTree a)
 deriving (Eq,Show,Ord)
nblack ::(Ord a) => a -> RBTree a -> Int
nblack _ RBNil = 0
nblack v (RBNode l x c r)
 |v==x = if c==Black then 1 else 0
 |v>x =  if c==Black then 1 + nblack v r else nblack v r
 |v<x =  if c==Black then 1 + nblack v l else nblack v l
blaip :: (Ord a) => RBTree a -> [Int]
blaip RBNil = []
blaip (RBNode RBNil x c RBNil) = if c==Black then [1] else [0]
blaip (RBNode l x c r) = if c==Black then map ((+) 1) (blaip l  ++ blaip r) else (blaip l ++ blaip r)
isbl ::(Ord a) => RBTree a -> Bool
isbl = alsame.blaip
 where
     alsame [] = True
     alsame [x] = True
     alsame (x:y:ys) = (x==y) && (alsame (y:ys))
isr :: (Ord a) => RBTree a -> Bool
isr RBNil = True
isr (RBNode l x c r) = if c==Red then (allb l) && (allb r) else (isr l) && (isr r)
 where
     allb RBNil = True 
     allb (RBNode l x c r) = c ==Black && (allb l) && (allb r)
