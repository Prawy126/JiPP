module Lists where

import Data.Char(isLower)

{- Task 1 *

1. Analyze the function call sum1 [3,5,7].

2. Analyze the function call sum1 [3,5,7,9].

Follow the examples in silnia.pps and on the site:

http://www.balois.pl/jipp/haskell/listy.htm
-}

sum1 :: Num a => [a] -> a
sum1 [] = 0
sum1 (x:xs) = x + sum1 xs

{-
Analiza wywo³ania sum1 [3,5,7]:

1. sum1 [3,5,7]
   = 3 + sum1 [5,7]  -- pierwszy element 3, przekazujemy resztê listy [5,7]

2. sum1 [5,7]
   = 5 + sum1 [7]    -- pierwszy element 5, przekazujemy resztê listy [7]

3. sum1 [7]
   = 7 + sum1 []     -- pierwszy element 7, przekazujemy resztê listy []

4. sum1 []
   = 0               -- warunek bazowy, zwracamy 0

5. Teraz sumujemy wyniki:
   = 7 + 0  = 7
   = 5 + 7  = 12
   = 3 + 12 = 15
   Ostateczny wynik: 15
-}

{- 
Analiza wywo³ania sum1 [3,5,7,9]:

1. sum1 [3,5,7,9]
   = 3 + sum1 [5,7,9]

2. sum1 [5,7,9]
   = 5 + sum1 [7,9]

3. sum1 [7,9]
   = 7 + sum1 [9]

4. sum1 [9]
   = 9 + sum1 []

5. sum1 []
   = 0

6. Teraz sumujemy wyniki:
   = 9 + 0  = 9
   = 7 + 9  = 16
   = 5 + 16 = 21
   = 3 + 21 = 24
   Ostateczny wynik: 24
-}

sum2 :: Num a => [a] -> a
sum2 xs = sum [x | (x, i) <- zip xs [0..], even i]

sum3 :: Num a => [a] -> a
sum3 xs = sum [x | (x, i) <- zip xs [0..], (i + 1) `mod` 3 == 0]

{-
ghci> sum2 [1,2,3,4,5,6]
9
ghci> sum2 [10,20,30,40,50,60, 70]
160
-}
-- 4.4

{-
(*) Zdefiniuj funkcjê string2bools, która listê znaków zastêpuje list¹ wartoœci logicznych okreœlaj¹cych, czy oryginalny element by³ ma³¹ liter¹, czy te¿ nie. Funkcjê umieœæ w module Lists.

Wskazówka:

Do modu³u Lists poni¿ej s³owa where dodaj poni¿sz¹ liniê:

import Data.Char
-}

string2bools :: String -> [Bool]
string2bools = map isLower

{-
ghci> string2bools "Hello"
[False,True,True,True,True]
ghci> string2bools "ABCxyz"
[False,False,False,True,True,True]
ghci> string2bools "123aB!"
[False,False,False,True,False,False]
-}

{- Task 4 *

Analyze the function call gtx 1 [2,1,3].

Follow the examples in silnia.pps and on the sites:

https://balois.pl/jipp/haskell/listy.htm
https://balois.pl/jipp/haskell/fold.htm
-}

{-
1. Rozwijamy wywo³anie countLower "Bob":
   countLower "Bob"
   = length (filter isLower "Bob")

2. Funkcja filter isLower "Bob":
   "Bob" › ['B', 'o', 'b']

   - 'B' › NIE jest ma³¹ liter¹ › odrzucamy
   - 'o' › JEST ma³¹ liter¹ › zostaje
   - 'b' › JEST ma³¹ liter¹ › zostaje

   Wynik dzia³ania filter:
   = "ob" (lista ['o', 'b'])

3. Teraz obliczamy d³ugoœæ wyniku:
   length "ob" = 2

Ostateczny wynik:
   countLower "Bob" = 2
-}

-- 4.5
{-
(*) funckja ltx listê elementów z listy wejœciowych mniejszych lub równych x.
(*) funkcja cltx liczbê elementów listy mniejszych od x;
-}

ltx :: Ord a => a -> [a] -> [a]
ltx x xs = [y | y <- xs, y <= x]

cltx :: Ord a => a -> [a] -> Int
cltx x xs = length [y | y <- xs, y < x]

{-
ghci> ltx 5 [3,7,1,5,9,4]
[3,1,5,4]
ghci> ltx 10 [15,8,20,3]
[8,3]
ghci> cltx 5 [3,7,1,5,9,4]
3
ghci> cltx 10 [15,8,20,3]
2
-}