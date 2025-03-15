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
*Lists> :t sum
sum :: (Num a, Foldable t) => t a -> a
*Lists> sqrt (sum[1,3,5])
3.0
-}

sumOfSquares' x =  sum (map (^2) x)

{-
*Lists> sumOfSquares' [1,2,3]
14
*Lists>
-}

--4.1.2

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
*Lists> f  [3,5,7]
(3,[5,7])
*Lists>
-}

sumOfSquares [] = 0
sumOfSquares (x:xs) = x*x + sumOfSquares xs

{-
*Lists> sumOfSquares [1,3,5]
35
*Lists> sumOfSquares []
0
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
*** Exception: <interactive>:1:5-17: Non-exhaustive patterns in f
-}

sum1 [] = 0
sum1 [_] = 0
sum1 (_:x:xs) = x + sum1 xs

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

-- 4.3.1

-- slides 32-36/71

{-
*Lists> :t "cat"
"cat" :: [Char]
*Lists> ['c', 'a', 't']
"cat"
*Lists> :t (:)
(:) :: a -> [a] -> [a]
*Lists> 3 : [5,7]
[3,5,7]
*Lists> [3,5] ++ [7]
[3,5,7]
*Lists> :t (++)
(++) :: [a] -> [a] -> [a]
*Lists> 'c' : "at"
"cat"
*Lists> "c" ++ "at"
"cat"
*Lists> let small x = 'a' <= x && x  <= 'z'
*Lists> small 'c'
True
*Lists> small 'X'
False
*Lists>
-}

counterLower [] = 0
counterLower (x:xs) | 'a' <= x && x <= 'z' = 1 + counterLower xs
                    | otherwise = counterLower xs
                    
{-
*Lists> counterLower "AAA"
0
*Lists> counterLower ""
0
*Lists> counterLower "aaa"
3
-}

-- 4.5.1

{-
The number of elements greater than x in the list (y:ys) with the head y and the tail ys,
in the case, x is less than y is equal to 1 plus the number of elements greater than x in the tail ys,
in the case, x is not less than y is equal to the number of elements greater than x in the tail ys.
-}

{-
How many arguments does the cgtx function take?

How many actual parameters do we pass to cgtx?
-}

cgtx x [] = 0
cgtx x (y:ys) | x<y = 1 + cgtx x ys
              | otherwise  = cgtx x ys

{-
*Lists> cgtx 3 [1,2,3,4,5]
2
-}

-- 4.5.3

{-
The list of elements greater than x from the list (y:ys) with the head y and the tail ys,
in the case, x is less than y is the list with the head y and the tail of elements greater than x in the tail ys,
in the case, x is not less than y is the list of elements greater than x in the tail ys.
-}

gtx x [] = []
gtx x (y:ys) | y > x = y : gtx x ys
             | otherwise = gtx x ys
             
{-
*Lists> gtx 3 [1, 2, 3, 4, 5]
[4,5]
-}

gtx' x [] = []
gtx' x (y:ys) | y > x = [y] ++ gtx' x ys
              | otherwise = gtx' x ys

{-
*Lists> gtx' 3 [1, 2, 3, 4, 5]
[4,5]
-}

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
*Lists> read "35" :: Float
35.0
*Lists> show 35
"35"
-}

string2int x = read x :: Int
string2int' x = show x

{-
*Lists> string2int "2"
2
*Lists> string2int' 2
"2"
-}
