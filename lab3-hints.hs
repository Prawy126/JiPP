module Math where

-- 3.1

-- slide 20/71

{-
This task illustrates how to use the if operator.
The general form for the | operator is as follows:

function parameters | condition = expression
-}

{-
*Math> not True
False
*Math> True && False
False
*Math> True || False
True
*Math> let f1 x | x == 0 = "zero"
*Math> f1 0
"zero"
*Math> f1 1
"*** Exception: <interactive>:5:5-26: Non-exhaustive patterns in function f1

*Math> let f2 x = if x == 0 then "zero" else undefined
*Math> f2 0
"zero"
*Math> f2 1
"*** Exception: Prelude.undefined
*Math> :t otherwise
otherwise :: Bool
*Math> otherwise
True
-}

f x | x < -10 = x*x
-- complete the solution with the use of logic operators where necessary

{-
*Math> f (-12)
144.0
*Math> f (-pi)
-1.2246063538223773e-16
*Math> f 1
1.0
*Math> f 5
*** Exception: lab3.hs:(3,1)-(5,31): Non-exhaustive patterns in function f
-}

{- Task 1

Define an analogous function f1' that for not matching values returns undefined.
-}

f' x | x < -10 = x*x
-- complete the solution

{-
*Math> f' (-12)
144.0
*Math> f' (-pi)
-1.2246063538223773e-16
*Math> f' 1
1.0
*Math> f' 5
*** Exception: Prelude.undefined
-}

{- Task 2 *

Define an analogous function f1'' without the use of logical operators.
-}

-- homework

-- 3.2

-- https://en.wikipedia.org/wiki/Binomial_coefficient

{-
*Math> :t div
div :: Integral a => a -> a -> a
*Math> :t (/)
(/) :: Fractional a => a -> a -> a
*Math> 6 `div` 4
1
*Math> 6 / 4
1.5
*Math> (6 :: Int) `div` (4 :: Int)
1
*Math> (6 :: Int) / (4 :: Int)

<interactive>:32:12:
    No instance for (Fractional Int) arising from a use of ‘/’
    In the expression: (6 :: Int) / (4 :: Int)
    In an equation for ‘it’: it = (6 :: Int) / (4 :: Int)
-}

factorial :: Integer -> Integer
-- complete the definition

-- function binomialCoefficient must check the condition 0 <= k <= n

binomialCoefficient k n
-- complete the definition

{-
*Math> factorial 3
6
*Math> binomialCoefficient 3 5
10
-}

-- 3.3 *

-- homework

-- 3.4

{-
*Math> :t rem
rem :: Integral a => a -> a -> a
*Math> rem 3 2
1
*Math> rem 3 3
0
-}

divides :: Int -> Int -> Bool
divides k n = ...
-- complete the definition

{-
*Math> divides 2 5
False
*Math> divides 2 6
True
-}

-- 3.5

-- slide 21/71

seq' 1 = ...
seq' ...
seq' n = ...
-- complete the definition

{-
*Math> seq' 1
3.0
*Math> seq' 2
4.0
*Math> seq' 5
22.0
-}

{- Task 3 *

Write analogous function seq'' with the use of | operator and compare its type with seq'.
-}

-- homework

-- 3.6 *

-- homework

-- 3.7

{-
*Math> 3 * 5    -- operator
15
*Math> (*) 3 5  -- function
15
*Math> :t gcd
gcd :: Integral a => a -> a -> a
*Math> gcd 12 6
6
*Math> gcd 15 8
1
-}

(><) :: Integral a => a -> a -> Bool
x >< y = ...
-- complete the definition

{-
*Math> :t (><)
(><) :: Integral a => a -> a -> Bool
*Math> 12 >< 6
False
*Math> 15 >< 8
True
-}

-- 3.8 *

-- slides 27-28/71

-- 3.8.1

{-
*Math> :i +
class Num a where
  (+) :: a -> a -> a
  ...
        -- Defined in ‘GHC.Num’
infixl 6 +
-}

{-
The + operator associates to the left with the strength of binding equal to 6.

For the +. operator, we can define associativity and the strength of binding
analogously to the + operator.
-}

{-
z1 = a + b*i   i*i = -1
z2 = c + d*i

z1 + z2 = a + b*i + c + d*i = a + c + (b + d)*i
-}

infixl 6 +.
(+.) :: (Double, Double) -> (Double, Double) -> (Double, Double)
(a,b) +. (c,d) = (a+c, b+d)

{-
*Math> (3.14, -1) +. (-1,5)
(2.14,4.0)
-}

-- 3.8.2 *

-- homework

-- 3.8.3

{-
z1 = a + b*i   i*i = -1
z2 = c + d*i

z1 * z2 = (a + b*i)*(c + d*i) = a*c + a*d*i + b*c*i + b*d*i*i = a*c - b*d + (a*d + b*c)*i
-}

-- solution here

infixl 7 *.
(*.) :: (Double, Double) -> (Double, Double) -> (Double, Double)
(a,b) *. (c,d) = (a*c - b*d, a*d + b*c)

-- 3.8.4 *

-- homework

-- 3.8.5

{-
Write three different definitions of i.
-}

-- solution here

{-
*Math> i
(0.0,1.0)
*Math> i'
(0.0,1.0)
*Math> i''
(0.0,1.0)
-}

-- 3.9 *

-- homework




