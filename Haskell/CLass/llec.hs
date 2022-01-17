data Bst a =Nil|Node (Bst a) a (Bst a) deriving (Show,Eq,Ord)
inorder ::(Ord a)=> Bst a -> [a]
inorder Nil = []
inorder (Node l x r) = (inorder l) ++ [x] ++ ( inorder r)
empty = Nil
isempty :: Bst a -> Bool
isempty Nil = True 
isempty _ = False
isbst :: Bst a -> Bool
isbst Nil = True
isbst (Node l x r) = (isbst l) && (isbst r) && (isempty l || maxt l < x) && (isempty r || mint r > x)
maxt :: Ord a => Bst a -> a
maxt (Node _ w Nil) = w
maxt (Node _ _ r) = maxt r
-- just do inorder and check if sorted 
issort :: (Ord a) =>[a] -> Bool
issort [] = True
issort [x] = True
issort (x:y:ys) = if x<=y then issort (y:ys) else False