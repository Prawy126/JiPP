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