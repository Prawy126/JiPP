module Tress where

-- 5.3

{-
(*) Zdefiniuj funkcjê trapezoidalRule wyznaczaj¹c¹ przybli¿on¹ wartoœæ ca³ki oznaczonej metod¹ trapezów. Przybli¿on¹ wartoœæ ca³ki wyznacza siê ze wzoru:
Funkcjê umieœæ w module Integration. Przetestuj dzia³anie funkcji trapezoidalRule dla przyk³adów z zadania 2 i porównaj wyniki.
-}
trapezoidalRule :: (Double -> Double) -> Double -> Double -> Int -> Double
trapezoidalRule f a b n = (h / 2) * (f a + f b + 2 * sum [f (a + fromIntegral i * h) | i <- [1..n-1]])
  where h = (b - a) / fromIntegral n
  
{-
ghci> trapezoidalRule sin 0 pi 1000
1.9999983550656624
ghci> trapezoidalRule sqrt 0 1 1000
0.6666601343936819
ghci> trapezoidalRule (\x -> x^2) 0 1 1000
0.33333349999999995
ghci> trapezoidalRule (\x -> x^3 + 2*x) 0 2 1000
8.000003999999997
-}

--5.6

{-
(*) Do modu³u Trees dodaj funkcjê elemTree ze slajdu 57. Popraw funkcjê tak, aby uwzglêdnia³a konstruktor Null.
(*) W module Trees zaimplementuj funkcjê countLeaves zwracaj¹c¹ informacjê o liczbie liœci w drzewie.
-}

-- Definicja drzewa binarnego
data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null
            deriving Show
bt_1 = Null
bt_2 = Leaf 5
bt_3 = Node 5 (Leaf 3) Null
bt_4 = Node 5 Null (Leaf 7)
bt_5 = Node 5 (Leaf 3) (Leaf 7)

treeSize :: Tree a -> Int
treeSize Null = 0
treeSize (Leaf _) = 1
treeSize (Node _ left right) = 1 + treeSize left + treeSize right

showTree :: Show a => Tree a -> String
-- complete the definition


bt1 = Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Leaf 10)
 
bt2 = Node 7 (Node 4 (Leaf 2) (Leaf 5)) 
             (Node 10 (Leaf 9) (Node 13 (Leaf 11) (Leaf 15)))
 
bt3 = Node 7 (Leaf 1) Null

showTree Null = "()"
showTree (Leaf x) = show x
showTree (Node x left right) = show x ++ " L(" ++ showTree left ++ ") R"  ++ showTree right ++ ")"

add ::Ord a => a -> Tree a -> Tree a
add x Null = Leaf x
add x (Leaf y) | x == y = Leaf y
               | x < y = Node y (Leaf x) Null
               | x > y = Node y Null (Leaf x)
add x (Node y left right) | x == y = Node y left right
                          | x < y = Node y (add x left) right
                          | x > y = Node y left (add x right)


elemTree :: Eq a => a -> Tree a -> Bool
elemTree _ Null = False
elemTree x (Leaf y) = x == y
elemTree x (Node y left right)
  | x == y    = True
  | otherwise = elemTree x left || elemTree x right

countLeaves :: Tree a -> Int
countLeaves Null = 0
countLeaves (Leaf _) = 1
countLeaves (Node _ left right) = countLeaves left + countLeaves right


{-
ghci> elemTree 3 Null
False
ghci> elemTree 3 (Leaf 3)
True
ghci> elemTree 3 (Leaf 5)
False
ghci> elemTree 3 bt1
False
ghci> elemTree 4 bt1
True

ghci> countLeaves Null
0
ghci> countLeaves (Leaf 5)
1
ghci> countLeaves (add 6 bt1)
3
-}