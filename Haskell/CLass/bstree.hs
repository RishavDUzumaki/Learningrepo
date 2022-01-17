data Bstree a = Nil | Node (Bstree a) a (Bstree a) deriving (Show,Eq,Ord)
isbs ::(Ord a) => Bstree  a -> Bool
isbs Nil = True  
isbs (Node l x r) = isbs l && isbs r && (l==Nil|| maxt l>x) && (r==Nil|| mint r<x)
 where
     maxt ::(Ord a) => Bstree a -> a
     maxt (Node l x r) = if l==Nil && r==Nil then x else if l==Nil then max x (maxt r)  else if r==Nil then max (maxt l) x else max (max x (maxt r)) (maxt l)
     mint ::(Ord a) => Bstree a -> a
     mint (Node l x r) = if l==Nil && r==Nil then x else if l==Nil then min x (mint r)  else (if r==Nil then min (mint l) x else min (min x (mint r)) (mint l))
listree ::(Ord a)=>  [a] -> (Bstree a)
listree [] = Nil
listree (x:xs) =Node  (listree [t | t<-xs , t<x]) x (listree [t | t<-xs , t>x])
search :: (Ord a) => Bstree a -> a -> Bool
search Nil v =False
search (Node l x r) v = if v==x then True else if v>x then search r v else search l v
insert ::(Ord a) => Bstree a -> a  -> Bstree a
insert Nil v = Node Nil v Nil
insert (Node l x r) v = if v==x then (Node l x r) else if v>x then insert r v else insert l v 
delete :: (Ord a) => Bstree a -> a -> Bstree a
delete Nil v = Nil
delete (Node l x r) v = if v==x then  (attach l r) else if v>x then Node l x (delete r v) else Node (delete l v) x r
 where
     attach l r = if l==Nil && r == Nil then Nil else if l==Nil then r else if r==Nil then l else let (Node a d b) = r  in Node (attach l a) d b 
l1 = listree [5,7,2,3,6,1,9,8,7,6,5,4,3,2]   
path :: Ord a => a -> Bstree a -> [a]
path _ Nil = []
path v (Node l x r) = let (ls,rs)=(path v l,path v r) in if x==v then [v] else if x>v then if ls==[] then [] else x:ls else if rs==[] then [] else x:rs