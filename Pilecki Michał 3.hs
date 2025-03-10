module Math where

{- Task 2 *

Define an analogous function f1'' without the use of logical operators.
-}
f1'' :: Bool -> Bool -> Bool
f1'' True True = True
f1'' True False = False
f1'' False True = False
f1'' False False = False
{-
ghci> f1'' True True
True
ghci> f1'' True False
False
ghci> f1'' False False
False
ghci> f1'' False True
False
-}

{-
Zadanie 3.3
(*) definiuj rekurencyjną funkcję factorial2 wyznaczająca silnię podwójną z liczby całkowitej nieujemnej n:

    n!! = 1 dla n = 0 i n = 1
    n!! = n(n - 2)!! dla n > 1

Funkcję umieść w module Math.
-}

factorial2 :: Integer -> Integer
factorial2 n
    | n == 0 || n == 1 = 1
    | n > 1 = n * factorial2 (n - 2)

{-
ghci> factorial2 1
1
ghci> factorial2 6
48
-}

-- 3.5

seq' 1 = 3
seq' 2 = 4
seq' n = 0.5 * seq' (n - 1) + 2 * seq' (n - 2)

{-
*Math> seq' 1
3.0
*Math> seq' 2
4.0
*Math> seq' 3
8.0
*Math> seq' 4
12.0
*Math> seq' 5
22.0
*Math> seq' 6
35.0
-}


{- Task 3 *

Write analogous function seq'' with the use of | operator and compare its type with seq'.
-}

seq'' :: (Num t, Ord t, Fractional a) => t -> a
seq'' n | n == 1 = 3
        | n == 2 = 4
        | n > 2 = 0.5 * seq'' (n - 1) + 2 * seq'' (n - 2)

{-
ghci> seq'' 1
3.0
ghci> seq'' 2
4.0
ghci> seq'' 5
22.0
-}

{-
Zadanie 3.6

(*) Zdefiniuj własną funkcję gcd' (największy wspólny dzielnik). Implementacja ma się opierać na algorytmie Euklidesa. Można stosować wyłącznie operatory relacyjne i operator odejmowania. Funkcję umieść w module Math
-}

gcd' :: Integer -> Integer -> Integer
gcd' a b
    | a == b    = a
    | a > b     = gcd' (a - b) b
    | otherwise = gcd' a (b - a)

{-
[1 of 1] Compiling Math             ( Pilecki Michał 3.hs, interpreted )
Ok, one module loaded.
ghci> gcd' 48 18
6
ghci> gcd' 56 98
14
ghci> gcd' 101 103
1
-}

type Complex = (Double, Double)

(+.) :: Complex -> Complex -> Complex
(a, b) +. (c, d) = (a + c, b + d)

(-.) :: Complex -> Complex -> Complex
(a, b) -. (c, d) = (a - c, b - d)

(*.) :: Complex -> Complex -> Complex
(a, b) *. (c, d) = (a * c - b * d, a * d + b * c)

re :: Complex -> Double
re (a, _) = a

im :: Complex -> Double
im (_, b) = b

i :: Complex
i = (0, 1)

{-
hci> :l "Pilecki Michał 3.hs"
[1 of 1] Compiling Math             ( Pilecki Michał 3.hs, interpreted )
Ok, one module loaded.
ghci> (3, 4) +. (1, 2)
(4.0,6.0)
ghci> (3, 4) -. (1, 2)
(2.0,2.0)
ghci> (3, 4) *. (1, 2)
(-5.0,10.0)
ghci> re (3,4)
3.0
ghci> im (3, 4)
4.0
ghci> i
(0.0,1.0)
-}

type Vector = (Double, Double, Double)

(+.) :: Vector -> Vector -> Vector
(x1, y1, z1) +. (x2, y2, z2) = (x1 + x2, y1 + y2, z1 + z2)

(-.) :: Vector -> Vector -> Vector
(x1, y1, z1) -. (x2, y2, z2) = (x1 - x2, y1 - y2, z1 - z2)

(*.) :: Vector -> Vector -> Double
(x1, y1, z1) *. (x2, y2, z2) = x1 * x2 + y1 * y2 + z1 * z2

(***) :: Vector -> Vector -> Vector
(x1, y1, z1) *** (x2, y2, z2) =
    ( y1 * z2 - z1 * y2,
      z1 * x2 - x1 * z2,
      x1 * y2 - y1 * x2 )

{-
ghci> (1, 2, 3) +. (1, 2, 3)
(2.0,4.0,6.0)
ghci> (1, 2, 3) -. (1, 2, 3)
(0.0,0.0,0.0)
ghci> (1, 2, 3) *. (1, 2, 3)
14.0
ghci> (1, 2, 3) *** (1, 2, 3)
(0.0,0.0,0.0)
-}
