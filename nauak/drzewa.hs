data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null
            deriving (Show)

sumTree :: Num a => Tree a -> a
sumTree Null = 0
sumTree (Leaf x) = x
sumTree (Node x left right) = x + sumTree left + sumTree right

tree = Null
tree2 = Leaf 5
tree3 = Node 10 (Leaf 2) (Node 3 (Leaf 4) (Leaf 6))

showTree :: (Show a) => Tree a -> String
showTree Null = "()"  -- Puste drzewo
showTree (Leaf x) = show x  -- Li�� zawiera tylko warto��
showTree (Node x left right) =
    show x ++  -- Warto�� w�z�a
    " L(" ++ showTree left ++ ")" ++  -- Lewe poddrzewo
    " R(" ++ showTree right ++ ")"    -- Prawe poddrzewo

add :: (Ord a) => a -> Tree a -> Tree a
add x Null = Leaf x  -- Je�li drzewo jest puste, tworzymy nowy li��
add x (Leaf y)
    | x == y    = Leaf y  -- Element ju� istnieje
    | x < y     = Node y (Leaf x) Null  -- Dodajemy do lewego poddrzewa
    | otherwise = Node y Null (Leaf x)  -- Dodajemy do prawego poddrzewa
add x (Node y left right)
    | x == y    = Node y left right  -- Element ju� istnieje
    | x < y     = Node y (add x left) right  -- Dodajemy do lewego poddrzewa
    | otherwise = Node y left (add x right)  -- Dodajemy do prawego poddrzewa
    
elemTree :: Ord a => a -> Tree a-> Bool
elemTree _ Null = False
elemTree x (Leaf val) = x == val
elemTree x (Node val left right)
  | x == val = True
  | x < val = elemTree x left
  | otherwise = elemTree x right
 
countLeaves :: Tree a -> Int
countLeaves Null = 0  -- Brak li�ci w pustym drzewie
countLeaves (Leaf _) = 1  -- Li�� to jeden element
countLeaves (Node _ left right) =
    countLeaves left + countLeaves right  -- Sumujemy li�cie w poddrzewach

tree2list :: Tree a -> [a]
tree2list Null = []  -- Puste drzewo daje pust� list�
tree2list (Leaf x) = [x]  -- Li�� daje list� jednoelementow�
tree2list (Node x left right) =
    tree2list left ++ [x] ++ tree2list right  -- ��czymy lewe poddrzewo, w�ze� i prawe poddrzewo

list2tree :: [a] -> Tree a
list2tree [] = Null  -- Pusta lista daje puste drzewo
list2tree xs =
    let (left, mid:right) = splitAt (length xs `div` 2) xs  -- Dzielimy list� na po�ow�
    in Node mid (list2tree left) (list2tree right)  -- Tworzymy w�ze� i rekurencyjnie budujemy poddrzewa
