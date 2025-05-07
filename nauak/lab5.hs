-- 5.2

{-
*Main> :t (/)
(/) :: Fractional a => a -> a -> a
*Main> (3 :: Float) / (5 :: Int)

<interactive>:2:17: error:
    * Couldn't match expected type `Float' with actual type `Int'
    * In the second argument of `(/)', namely `(5 :: Int)'
      In the expression: (3 :: Float) / (5 :: Int)
      In an equation for `it': it = (3 :: Float) / (5 :: Int)
*Main> (3 :: Int) * (5 :: Float)

<interactive>:3:15: error:
    * Couldn't match expected type `Int' with actual type `Float'
    * In the second argument of `(*)', namely `(5 :: Float)'
      In the expression: (3 :: Int) * (5 :: Float)
      In an equation for `it': it = (3 :: Int) * (5 :: Float)
*Main> :t fromIntegral
fromIntegral :: (Num b, Integral a) => a -> b
*Main> (3 :: Float) / fromIntegral (5 :: Int)
0.6
*Main> fromIntegral (3 :: Int) * (5 :: Float)
15.0
-}

rectangleRule :: (Float -> Float) -> Float -> Float -> Int -> Float
rectangleRule f a b n = h * sum (map f points)
  where
    h = (b - a) / fromIntegral(n)
    points = [a + fromIntegral(i) * h | i <- [1 .. n]]

{-
How many arguments does the function rectangleRule take?

What is the type of parameter f?
What is the type of parameter a?
What is the type of parameter b?
What is the type of parameter n?

What is the type of expression (b - a)?
Why do we need to use the function fromIntegral in the expression for h?
Why do we need to use the function fromIntegral in the expression for points?

What is the type of h?
What is the type of points?

What does the constant h stand for?
What does the constant points stand for?
-}

-- tests

integral1 = rectangleRule sin 0 pi 100   -- for 100 partitions
integral1' = rectangleRule sin 0 pi 1000 -- for 1000 partitions

{-
*Main> 2
2
*Main> integral1
1.9998356
*Main> integral1'
1.9999988
-}

integral2 = rectangleRule sqrt 0 1 100
integral2' = rectangleRule sqrt 0 1 1000

{-
*Main> 2 / 3
0.6666666666666666
*Main> integral2
0.6714629
*Main> integral2'
0.6671604
-}

integral3 = rectangleRule (^2) 0 1 100   -- with the use of section
integral3' = rectangleRule (^2) 0 1 1000  --

{-
*Main> 1 / 3
0.3333333333333333
*Main> integral3
0.33835
*Main> integral3'
0.33383355
-}

integral4 = rectangleRule (\ x -> x^3 + 2*x) 0 2 100   -- with the use of lambda notation
integral4' = rectangleRule (\ x -> x^3 + 2*x) 0 2 1000  --

{-
*Main> 8
8
*Main> integral4
8.120399
*Main> integral4'
8.012006
-}

-- 5.4

-- slide 57/71

{-
We will use the following symbols:

o    - empty node

5
*    - node with value 5
 _
/ \  - subtree
 _
/5\  - subtree with value 5
-}

data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null

{- Task 2

With the use of data type 'Tree a' define the following trees:

bt_1   o

       5
bt_2   *

       5  
bt_3   *
      / \ 
    3*   o

       5   
bt_4   *   
      / \  
     o   *7
     
       5
bt_5   *
      / \
    3*   *7
-}

bt_1 = Null
bt_2 = Leaf 5
bt_3 = Node 5 (Leaf 3) Null
bt_4 = Node 5 Null (Leaf 7)
bt_5 = Node 5 (Leaf 3) (Leaf 7)

treeSize :: Tree a -> Int
treeSize Null = 0
treeSize (Leaf _) = 1
treeSize (Node _ left right) = 1 + treeSize left + treeSize right

{-
*Main> treeSize bt_1
0
*Main> treeSize bt_2
1
*Main> treeSize bt_3
2
*Main> treeSize bt_4
2
*Main> treeSize bt_5
3
*Main>
-}

-- 5.4.2

-- complete the definition

bt1 = Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Leaf 10)
 
bt2 = Node 7 (Node 4 (Leaf 2) (Leaf 5)) 
             (Node 10 (Leaf 9) (Node 13 (Leaf 11) (Leaf 15)))
 
bt3 = Node 7 (Leaf 1) Null

showTree :: Show a => Tree a -> String
showTree Null = "()"
showTree (Leaf x) = show x
showTree (Node x left right) = show x ++ "L(" ++ showTree left ++ " R(" ++ showTree right ++ ")"

{-
*Main> showTree bt1
"7 L(4 L(2) R(5)) R(10)"
*Main> showTree bt2
"7 L(4 L(2) R(5)) R(10 L(9) R(13 L(11) R(15)))"
*Main> showTree bt3
"7 L(1) R(())"
-}

{-
*Main> showTree bt_1
"()"
*Main> showTree bt_2
"5"
*Main> showTree bt_3
"5L(3 R(())"
*Main> showTree bt_4
"5L(() R(7)"
*Main>
-}

-- 5.5

{-
1. Adding value to an empty tree

              5
add 5 o   =   *

2. Adding value to a one-element tree

      5       5
add 5 *   =   *

      5       5
add 3 *   =   *
             / \
           3*   o

      5       5
add 7 *   =   *
             / \
            o   *7

3. Adding value to a non-trivial tree

      5       5
add 5 *   =   *
    _/ \_   _/ \_
   / \ / \ / \ / \

      5       5
add 3 *   =   *
    _/ \_   _/ \_
   / \ / \ /3\ / \

      5       5
add 7 *   =   *
    _/ \_   _/ \_
   / \ / \ / \ /7\
-}

add :: Ord a => a -> Tree a -> Tree a
add x Null = Leaf x
add x (Leaf y) | x == y = Leaf y
               | x < y = Node y (Leaf x) Null
               | x > y = Node y Null (Leaf x)
add x (Node y left right) | x == y = Node y left right
                          | x < y = Node y (add x left) right
                          | x > y = Node y left (add x right)

{- Task 3

1. Add value 6 to the drawing of the b1 tree.

2. Add value 8 to the result of the previous task.

       7
bt1   / \
     4   10
    / \
   2   5
-}

{-
       7
bt1   / \
     4   10
    / \
   2   5
      / \
     o   6
-}

{-
       __7__
bt1   /     \
     4       10
    / \     /  \
   2   5   8    o
      / \
     o   6
-}

{-
*Main> showTree (add 6 bt_1)
"6"
*Main> showTree (add 8 (add 6 bt1))
"7L(4L(2 R(5L(() R(6)) R(10L(8 R(()))
*Main>
-}


-- 5.7.1 *

tree2list Null = []
tree2list (Leaf x) = [x]
tree2list (Node x left right) = tree2list left ++ [x] ++ tree2list right

{-
*Main> tree2list Null
[]
*Main> tree2list (Leaf 5)
[5]
*Main> tree2list bt1
[2,4,5,7,10]
*Main> tree2list (add 6 bt1)
[2,4,5,6,7,10]
*Main>
-}

-- 5.7.2 *

{-
*Main> let list = [1,3,5,7]
*Main> length list
4
*Main> length list `div` 2
2
*Main> list !! 2
5
*Main> :t take
take :: Int -> [a] -> [a]
*Main> take 2 list
[1,3]
*Main> :t drop
drop :: Int -> [a] -> [a]
*Main> drop (2 + 1) list
[7]
*Main>
-}

list2tree [] = Null
list2tree [x] = Leaf x
list2tree list = Node x (list2tree ltx) (list2tree gtx)
          where m = length list `div` 2
                x = list !! m
                ltx = take m list
                gtx = drop (m + 1) list 
                
{-
*Main> showTree (list2tree [])
"()"
*Main> showTree (list2tree [5])
"5"
*Main> showTree (list2tree [1,3,5,7])
"5L(3L(1 R(()) R(7)"
*Main> showTree (add 6 bt1)
"7L(4L(2 R(5L(() R(6)) R(10)"
*Main> showTree (list2tree (tree2list (add 6 bt1)))
"6L(4L(2 R(5) R(10L(7 R(()))"
*Main>
-}



