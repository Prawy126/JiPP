-- 2.1

{-
ghci> 2^100
1267650600228229401496703205376
ghci> (12+23)*(40-21)
665
ghci> 2^100 / ((12+23)*(40-21))
1.9062415041026007e27
ghci> sqrt 2
1.4142135623730951
ghci> sqrt ((12+23)*(40-21))
25.787593916455254
ghci> 2 + -3

<interactive>:7:1: error:
    Precedence parsing error
        cannot mix `+' [infixl 6] and prefix `-' [infixl 6] in the same infix expression
ghci> 2+(-3)
-1
ghci>
-}

{- Task 1

Check the associativity and the strength of binding for + and - operators.
-}

{-
ghci> :i +
type Num :: * -> Constraint
class Num a where
  (+) :: a -> a -> a
  ...
        -- Defined in `GHC.Num'
infixl 6 +
ghci> :i *
type Num :: * -> Constraint
class Num a where
  ...
  (*) :: a -> a -> a
  ...
        -- Defined in `GHC.Num'
infixl 7 *
ghci>
-}

-- 2.2
{-

ghci> rem 1234 2
0
ghci> 1234 `rem` 3
1
ghci> rem 1234 4
2
ghci>
-}

-- 2.3

{-
ghci> :t pi
pi :: Floating a => a
ghci> pi
3.141592653589793
ghci> let f x = 2*x + 1
ghci> f 5
11
ghci>
-}

