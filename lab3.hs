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
"*** Exception: <interactive>:4:5-26: Non-exhaustive patterns in function f1

*Math> let f2 x = if x == 0 then "zero" else undefined
*Math> f2 0
"zero"
*Math> f2 1
"*** Exception: Prelude.undefined
CallStack (from HasCallStack):
  error, called at libraries\base\GHC\Err.hs:79:14 in base:GHC.Err
  undefined, called at <interactive>:7:39 in interactive:Ghci6
*Math> :t otherwise
otherwise :: Bool
*Math> otherwise
True
-}

f x | x < -10 = x*x
    | -10 <= x && x < 0 = sin x
    | 0 <= x && x <= 2 = sqrt x
    | x > 2 = undefined
    
{-
*Math> f (-12)
144.0
*Math> f (-pi)
-1.2246063538223773e-16
*Math> f 1
1.0
*Math> f 5
*** Exception: Prelude.undefined
CallStack (from HasCallStack):
  error, called at libraries\base\GHC\Err.hs:79:14 in base:GHC.Err
  undefined, called at lab3.hs:44:15 in main:Math
*Math>
-}

f' x | x < -10 = x*x
     | -10 <= x && x < 0 = sin x
     | 0 <= x && x <=2 = sqrt x
     | otherwise = undefined
     
{-
*Math> f' (-12)
144.0
*Math> f' (-pi)
-1.2246063538223773e-16
*Math> f' 1
1.0
*Math> f' 5
*** Exception: Prelude.undefined
CallStack (from HasCallStack):
  error, called at libraries\base\GHC\Err.hs:79:14 in base:GHC.Err
  undefined, called at lab3.hs:64:20 in main:Math
*Math>
-}

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

<interactive>:10:1: error:
    * No instance for (Fractional Int) arising from a use of `/'
    * In the expression: (6 :: Int) / (4 :: Int)
      In an equation for `it': it = (6 :: Int) / (4 :: Int)
-}

silnia :: Integer -> Integer
silnia n | n == 0 = 1
         | n > 0 = n * silnia (n - 1)
         
-- complete the definition

-- function binomialCoefficient must check the condition 0 <= k <= n

binomialCoefficient k n | 0 <= k && k <= n =  


