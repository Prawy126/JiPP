-- 2.1

{-
*Main> 2^100
1267650600228229401496703205376
*Main> ...
665
*Main> ...
1.9062415041026007e27
*Main> sqrt 2
1.4142135623730951
*Main> ...
25.787593916455254
*Main> 2+ -3

<interactive>:13:1:
    Precedence parsing error
        cannot mix `+' [infixl 6] and prefix `-' [infixl 6] in the same infix ex
pression
*Main> 2+(-3)
-1
-}

{- Task 1

Check the associativity and the strength of binding for + and - operators.
-}

{-
*Main> :i +
class Num a where
  (+) :: a -> a -> a
  ...
        -- Defined in ‘GHC.Num’
infixl 6 +
*Main> :i -
class Num a where
  ...
  (-) :: a -> a -> a
  ...
        -- Defined in `GHC.Num'
infixl 6 -
-}

{-
The + operator associates to the left with the strength of binding equal
to 6, so the expression 2+ -3 is equivalent to (2+ -)3 and is incorrect.

2+ -3  <=>  (2+ -)3
-}

{- Task 2 *

Check the associativity and the strength of binding for operators: * / ^
-}

-- homework

-- 2.2

{-
*Main> rem 1234 2  -- only 2 is a divisor of 1234
0
*Main> 1234 `rem` 3
1
*Main> rem 1234 4
2
-}

-- 2.3

{-
*Main> :t pi
pi :: Floating a => a
*Main> pi
3.141592653589793
*Main> let f x = 2*x + 1
*Main> f 5
11
-}

-- complete the solution:

{-
*Main> let sphereVolume r = ...
*Main> sphereVolume 1
4.1887902047863905
*Main> let coneVolume r h = ...
*Main> coneVolume 1 2
2.0943951023931953
-}

-- 2.3.3

-- homework

-- 2.4

-- place the solution in solids.hs file

{-
To check the type of a function, use :type instruction.
-}

{-
*Solids> :t sphereVolume
sphereVolume :: Floating a => a -> a
*Solids> :type sphereVolume
sphereVolume :: Floating a => a -> a
-}

-- 2.5 *

-- homework

-- 2.6

-- slides 10-11/71

-- we do not define module Math

{-
g1 x = mod 12 x
g2 = mod 12        -- g2 is equivalent to g1, partial application of mod

h1 x = mod x 12    -- we cannot omit parameter x here
h2 x = x `mod` 12  -- function mod is written as operator `mod`
h3 = (`mod` 12)    -- h3 is equivalent to h1 and h2, right section for `mod`
-}

-- examples of sections:

{-
*Main> (2 ^) 3  -- left section
8
*Main> (^ 2) 3  -- right section
9
-}

f1 x = x - 2      -- is the definition f1 = -2 correct?
f1' x = x + (-2)
f1'' = (+ (-2))   -- right section

-- complete the solutions:

f2 x =
f2' x =
f2'' =

f3 x =
f3' =

f4 x =
f4' x =
f4'' =

{-
*Main> f1 1
-1
*Main> f1'' 1
-1
*Main> f2 25
0
*Main> f2'' 25
0
*Main> f3 7
False
*Main> f3' 7
False
*Main> f4 16
2
*Main> f4'' 16
2
-}

-- the rest for homework

-- 2.7 *

-- homework
