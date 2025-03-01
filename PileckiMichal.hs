module Triangle where

{-
2.6
(*) f5 zwraca True, je¿eli argument jest wiêkszy od 100 i False w przeciwnym przypadku;
(*) f6 zwraca resztê z dzielenia liczby 5 przez argument funkcji;
(*) f7 zwraca czêœæ ca³kowit¹ z dzielenia liczby 8 przez argument funkcji;
(*) f8 potraja pobierany argument.
-}

f5 a = a < 100

f6 a = a `rem` 5

f7 a = a `div` 8

f8 a = 3 * a

{-
ghci> f5 1
True
ghci> f5 101
False
ghci> f6 5
0
ghci> f6 6
1
ghci> f7 8
1
ghci> f7 17
2
ghci> f8 3
9
ghci> f8 21
63
-}

{-
Zadanie 2.7
Zdefiniuj modu³ Triangle i umieœæ w nim definicje funkcji trArea1, trArea2 i trArea3, które wyznaczaj¹ pole powierzchni trójk¹ta, przy czym ka¿da z tych funkcji wykorzystuje inny wzór na pole trójk¹ta.
-}

-- Pole trójk¹ta przy u¿yciu podstawy i wysokoœci
trArea1 :: Floating a => a -> a -> a
trArea1 base height = 0.5 * base * height

-- Pole trójk¹ta przy u¿yciu wzoru Herona (dla trzech boków)
trArea2 :: Floating a => a -> a -> a -> a
trArea2 a b c =
  let s = (a + b + c) / 2
  in sqrt (s * (s - a) * (s - b) * (s - c))

-- Pole trójk¹ta przy u¿yciu dwóch boków i k¹ta (k¹t w radianach)
trArea3 :: Floating a => a -> a -> a -> a
trArea3 a b angle = 0.5 * a * b * sin angle

{-
ghci> trArea1 23 12
138.0
ghci> trArea1 10 20
100.0
ghci> trArea2 10 20 15
72.61843774138907
ghci> trArea3 10 20 0.5
47.942553860420304
ghci>
-}

-- 3.1
f x | x < -10 = x*x
    | -10 <= x && x < 0 = sin x
    | 0 <= x && x <= 2 = sqrt x

{-
ghci> f (-15)
225.0
ghci> f 5
*** Exception: lab3.hs:(41,1)-(43,31): Non-exhaustive patterns in function f

ghci> f (-5)
0.9589242746631385
ghci> f 1
1.0
ghci> f 2
1.4142135623730951
-}

f' x | x < -10 = x*x
    | -10 <= x && x < 0 = sin x
    | 0 <= x && x <= 2 = sqrt x
    | otherwise = undefined
    
{-
ghci> f' (-15)
225.0
ghci> f' (-5)
0.9589242746631385
ghci> f' 1
1.0
ghci> f' 2
1.4142135623730951
ghci> f' 5
*** Exception: Prelude.undefined
CallStack (from HasCallStack):
  undefined, called at lab3.hs:52:19 in main:Math
-}

{- Task 2 *

Define an analogous function f1'' without the use of logical operators.
-}


f1'' x = if x < -10 then x * x
         else if x <= 0 then sin x
         else sqrt x

{-
ghci> f1'' (-15)
225.0
ghci> f1'' (-5)
0.9589242746631385
ghci> f1'' 2
1.4142135623730951
ghci> f'' 5

<interactive>:8:1: error:
    Variable not in scope: f'' :: t0 -> t
    Suggested fix:
      Perhaps use one of these: f' (line 59), f1'' (line 86)
-}