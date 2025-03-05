module Lists where

import Data.Char

-- 4.1.1

{-
*Lists> :t map
map :: (a -> b) -> [a] -> [b]
*Lists> map (^2) [1,3,5]
[1,9,25]
*Lists> map (\x -> x*x) [1,3,5]
[1,9,25]
*Lists> let f = (^2) in map f [1,3,5]
[1,9,25]
*Lists> sum [1,3,5]
9
*Lists> sqrt (sum [1,3,5])
3.0
-}

sumOfSquares' x = ...

{-
*Lists> sumOfSquares' [1,3,5]
35
-}

-- 4.1.2

{-
*Lists> :t (:)
(:) :: a -> [a] -> [a]
*Lists> 3:[]
[3]
*Lists> 3:5:[]
[3,5]
*Lists> 3:[5]
[3,5]
*Lists> let f (x:xs) = (x, xs)
*Lists> f [3,5,7]
(3,[5,7])
-}

-- http://www.balois.pl/jipp/haskell/listy.htm

-- solution here

{-
*Lists> sumOfSquares [1,3,5]
35
-}

-- 4.2.1

-- slide 34/71

{-
Odd indexes are denoted with an asterisk.

           *     *
        0  1  2  3
list = [3, 5, 7, 9]
-}

{-
*Lists> let f0 (x:xs) = x
*Lists> let f1 (_:x:xs) = x
*Lists> let f2 (_:_:x:xs) = x
*Lists> f0 [3,5,7]
3
*Lists> f1 [3,5,7]
5
*Lists> f2 [3,5,7]
7
*Lists> f0 []
*** Exception: <interactive>:11:5-17: Non-exhaustive patterns in function f0
-}

-- http://www.balois.pl/jipp/haskell/listy.htm

-- solution here

{-
*Lists> sum1 []
0
*Lists> sum1 [3]
0
*Lists> sum1 [3,5,7]
5
*Lists> sum1 [3,5,7,9]
14
-}

{- Task 1 *

1. Analyze the function call sum1 [3,5,7].

2. Analyze the function call sum1 [3,5,7,9].

Follow the examples in silnia.pps and on the site:

http://www.balois.pl/jipp/haskell/listy.htm
-}

-- homework

-- 4.2.2 *

-- homework

{- Task 2 *

1. Analyze the function call sum2 [3,5,7].

2. Analyze the function call sum2 [3,5,7,9].

Follow the examples in silnia.pps and on the site:

http://www.balois.pl/jipp/haskell/listy.htm
-}

-- homework

-- 4.2.3 *

-- homework

-- 4.3.1

-- slides 32-36/71

{-
*Lists> :t "cat"
"cat" :: [Char]
*Lists> ['c','a','t']
"cat"
*Lists> 3 : [5,7]
[3,5,7]
*Lists> [3,5] ++ [7]
[3,5,7]
*Lists> 'c' : "at"
"cat"
*Lists> "c" ++ "at"
"cat"
*Lists> let small x = 'a' <= x && x <= 'z'
*Lists> small 'c'
True
*Lists> small 'X'
False
-}

-- solution here

{-
*Lists> countLower "cat Bob"
5
-}

{- Task 3 *

Analyze the function call countLower "Bob".

Follow the examples in silnia.pps and on the sites:

https://balois.pl/jipp/haskell/listy.htm
https://balois.pl/jipp/haskell/fold.htm
-}

-- 4.3.2 *

-- homework

-- 4.4 *

-- homework

-- 4.5.1

{-
How many arguments does the cgtx function take?

How many actual parameters do we pass to cgtx?
-}

{-
The number of elements greater than x in the list (y:ys) with the head y and the tail ys,
in the case, x is less than y is equal to 1 plus the number of elements greater than x in the tail ys,
in the case, x is not less than y is equal to the number of elements greater than x in the tail ys.
-}

-- solution here

{-
*Lists> cgtx 3 [1,2,3,4,5]
2
-}

-- 4.5.2 *

-- homework

-- 4.5.3

{-
The list of elements greater than x from the list (y:ys) with the head y and the tail ys,
in the case, x is less than y is the list with the head y and the tail of elements greater than x in the tail ys,
in the case, x is not less than y is the list of elements greater than x in the tail ys.
-}

-- solution here

{-
*Lists> gtx 3 [1,2,3,4,5]
[4,5]
-}

{- Task 4 *

Analyze the function call gtx 1 [2,1,3].

Follow the examples in silnia.pps and on the sites:

https://balois.pl/jipp/haskell/listy.htm
https://balois.pl/jipp/haskell/fold.htm
-}

-- homework

-- 4.5.4 *

-- homework

-- 4.6

-- slides 14-15/71

{-
*Lists> :t read
read :: Read a => String -> a
*Lists> :t show
show :: Show a => a -> String
*Lists> read "35"
*** Exception: Prelude.read: no parse
*Lists> read "35" :: Int
35
*Lists> show 35
"35"
-}

-- solution here

{-
*Lists> string2int "35"
35
-}

-- second solution here, do not use :: operator

{-
*Lists> string2int' "35"
35
-}

-- 4.7

{-
*Lists> :t sum
sum :: (Num a, Foldable t) => t a -> a
*Lists> :t product
product :: (Num a, Foldable t) => t a -> a
*Lists> sum [1,3,5]
9
*Lists> product [1,3,5]
15
*Lists> [1..5]
[1,2,3,4,5]
*Lists> [n | n <- [1..5]]
[1,2,3,4,5]
-}

-- 4.7.1

{-
suma1 = 1 + 1/2 + 1/3 + ... + 1/100
-}

-- solution here

suma1 = ...    -- with the use of section, slide 11/71
suma1' = ...   -- with the use of lambda notation, slide 43/71
suma1'' = ...  -- with the use of set notation, slide 45/71

{-
*Lists> suma1
5.187377517639621
*Lists> suma1'
5.187377517639621
*Lists> suma1''
5.187377517639621
-}

-- 4.7.2

-- solution here

iloczyn1 = ...    -- with the use of lambda notation, slide 43/71
iloczyn1' = ...   -- with the use of set notation, slide 45/71
iloczyn1'' = ...  -- with the use of one of the fold functions instead of product, slide 41,42/71
                  -- http://www.balois.pl/jipp/haskell/fold.htm

{-
*Lists> iloczyn1
3.846153846153846e-2
*Lists> iloczyn1'
3.846153846153846e-2
*Lists> iloczyn1''
3.846153846153844e-2
-}

-- 4.7.3 *

-- homework

-- 4.7.4 *

-- homework

-- 4.7.5 *

-- homework

-- 4.8

-- slide 45/71

-- solution here

-- 4.8.1 *

-- homework

-- 4.8.2 *

-- homework
