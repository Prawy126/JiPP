-- 5.1 *

-- homework

-- slide 30/71

infix 5 ~=
a ~= b = abs (a - b) < h where h = 0.000001

cubeRoot x = ...

-- 5.2

{-
* Right Riemann sum

   y               / y = f(x)
   |            __/
   |           | /|
   |           |/ |
   |         __/  |
   |        | /|  |
   |        |/ |  |
   |      __/  |  |
   |     | /|  |  |
   |     |/ |  |  |
   |     /  |  |  |
---+--+--+--+--+--+--+--+---> x
   |     x0 x1 x2 x3
   |     a        b

Partitions: 3

Area(3) = (x1 - x0)*f(x1) + (x2 - x1)*f(x2) + (x3 - x2)*f(x3)

A:  x_i - x_i-1 = h = (b - a)/3  for  i = 1..3

                                          3_
                                          \
Area(3) = h*(f(x1) + f(x2) + f(x3)) = h * /_ f(x_i)
                                          i=1

Partitions: n

Area(n) = (x1 - x0)*f(x1) + (x2 - x1)*f(x2) + ... + (x_n - x_n-1)*f(x_n)

A:  x_i - x_i-1 = h = (b - a)/n  for  i = 1..n

                                                 n_
                                                 \
Area(n) = h*(f(x1) + f(x2) + ... + f(x_n)) = h * /_ f(x_i)
                                                 i=1
-}

{- Task 1 *

Provide an analogous deriving for the Left Riemann sum.
-}

-- homework

{-
*Main> :t (/)
(/) :: Fractional a => a -> a -> a
*Main> (3 :: Float) / (5 :: Int)

<interactive>:3:17:
    Couldn't match expected type ‘Float’ with actual type ‘Int’
    In the second argument of ‘(/)’, namely ‘(5 :: Int)’
    In the expression: (3 :: Float) / (5 :: Int)
    In an equation for ‘it’: it = (3 :: Float) / (5 :: Int)
*Main> (3 :: Int) * (5 :: Float)

<interactive>:4:15:
    Couldn't match expected type ‘Int’ with actual type ‘Float’
    In the second argument of ‘(*)’, namely ‘(5 :: Float)’
    In the expression: (3 :: Int) * (5 :: Float)
    In an equation for ‘it’: it = (3 :: Int) * (5 :: Float)
*Main> :t fromIntegral
fromIntegral :: (Integral a, Num b) => a -> b
*Main> (3 :: Float) / fromIntegral (5 :: Int)
0.6
*Main> fromIntegral (3 :: Int) * (5 :: Float)
15.0
-}

rectangleRule :: (Float -> Float) -> Float -> Float -> Int -> Float
rectangleRule f a b n = ...
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

integral1 = rectangleRule sin ...   -- for 100 partitions
integral1' = rectangleRule sin ...  -- for 1000 partitions

integral2 = rectangleRule ...
integral2' = rectangleRule ...

integral3 = rectangleRule ...   -- with the use of section
integral3' = rectangleRule ...  --

integral4 = rectangleRule ...   -- with the use of lambda notation
integral4' = rectangleRule ...  --

{-
*Main> integral1
1.9998356
*Main> integral1'
1.9999988
*Main> 2/3
0.6666666666666666
*Main> integral2
0.6714629
*Main> integral2'
0.6671604
*Main> 1/3
0.3333333333333333
*Main> integral3
0.33835
*Main> integral3'
0.33383355
*Main> integral4
8.120399
*Main> integral4'
8.012006
*Main>
-}

-- 5.3 *

-- homework

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

-- solution here

-- 5.4.1

-- solution here

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
-}

-- 5.4.2

showTree :: Show a => Tree a -> String
-- complete the definition


bt1 = Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Leaf 10)
 
bt2 = Node 7 (Node 4 (Leaf 2) (Leaf 5)) 
             (Node 10 (Leaf 9) (Node 13 (Leaf 11) (Leaf 15)))
 
bt3 = Node 7 (Leaf 1) Null

{-
*Main> showTree bt1
"7 L(4 L(2) R(5)) R(10)"
*Main> showTree bt2
"7 L(4 L(2) R(5)) R(10 L(9) R(13 L(11) R(15)))"
*Main> showTree bt3
"7 L(1) R(())"
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
-- complete the definition

{- Task 3

1. Add value 6 to the drawing of the b1 tree.

2. Add value 8 to the result of the previous task.

       7
bt1   / \
     4   10
    / \
   2   5
-}

-- solution here

{-
*Main> showTree (add 6 bt1)
...
*Main> showTree (add 8 (add 6 bt1))
...
-}

-- 5.6.1 *

elemTree :: Ord a => a -> Tree a -> Bool
-- complete the definition

{-
*Main> elemTree 3 Null
False
*Main> elemTree 3 (Leaf 3)
True
*Main> elemTree 3 (Leaf 5)
False
*Main> elemTree 3 bt1
False
*Main> elemTree 4 bt1
True
-}

{-
Does the function elemTree work correctly for all binary trees?
-}

-- 5.6.2 *

-- solution here

{-
*Main> countLeaves Null
0
*Main> countLeaves (Leaf 5)
1
*Main> countLeaves (add 6 bt1)
3
-}

-- 5.7.1 *

-- solution here

{-
*Main> tree2list Null
[]
*Main> tree2list (Leaf 5)
[5]
*Main> tree2list bt1
[2,4,5,7,10]
*Main> tree2list (add 6 bt1)
[2,4,5,6,7,10]
-}

-- 5.7.2 *

{-
What does m stand for?
What does x stand for?

              m
        0  1  2  3
list = [1, 3, 5, 7]
              x

              m
        0  1  2  3  4
list = [1, 3, 5, 7, 9]
              x

Stages of creation of a tree for the list [1,3,5,7]

      5
     / \
[1,3]   [7]

      5
     / \
    3   7
   / \
[1]   []

      5
     / \
    3   7
   / \
  1   o
-}

{- Task 4

Draw stages of the creation of a tree for the list [1,3,5,7,9]
-}

-- solution here

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
-}

list2tree :: Ord a => [a] -> Tree a
-- complete the definition

{-
*Main> showTree (list2tree [])
"()"
*Main> showTree (list2tree [5])
"5"
*Main> showTree (list2tree [1,3,5,7])
"5 L(3 L(1) R(())) R(7)"
*Main> showTree (add 6 bt1)
"7 L(4 L(2) R(5 L(()) R(6))) R(10)"
*Main> showTree (list2tree (tree2list (add 6 bt1)))
"6 L(4 L(2) R(5)) R(10 L(7) R(()))"
-}

{- Task 5 *

1. Draw the tree that comes as a result of (add 6 bt1).

2. Draw the tree that comes as a result of (list2tree (tree2list (add 6 bt1)).

3. Elaborate on the differences between the two above trees.
-}

