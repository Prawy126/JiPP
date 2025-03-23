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
Analiza wywo�ania sum1 [3,5,7]:

1. sum1 [3,5,7]
   = 3 + sum1 [5,7]  -- pierwszy element 3, przekazujemy reszt� listy [5,7]

2. sum1 [5,7]
   = 5 + sum1 [7]    -- pierwszy element 5, przekazujemy reszt� listy [7]

3. sum1 [7]
   = 7 + sum1 []     -- pierwszy element 7, przekazujemy reszt� listy []

4. sum1 []
   = 0               -- warunek bazowy, zwracamy 0

5. Teraz sumujemy wyniki:
   = 7 + 0  = 7
   = 5 + 7  = 12
   = 3 + 12 = 15
   Ostateczny wynik: 15
-}

{- 
Analiza wywo�ania sum1 [3,5,7,9]:

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

-- 4.2.2 zdefiniuj funkcj� sum2, kt�ra jako argument przyjmuje list� liczb i zwraca sum� element�w o indeksach parzystych

sum2 [] = 0
sum2 (x:_:xs) = x + sum2 xs
sum2 (x:[]) = x

{-
ghci> sum2 [1]
1
ghci> sum2 [1,2]
1
ghci> sum2 [1,2,3]
4
-}

-- 4.2.3 funkcj� sum3, kt�ra jako argument przyjmuje list� liczb i zwraca sum� element�w o indeksach 3, 6, 9, �;

sum3 [] = 0
sum3 [_] = 0
sum3 [_, _] = 0
sum3 (_:_:x:xs) = x + sum3 xs

{-
ghci> sum3 []
0
ghci> sum3 [1]
0
ghci> sum3 [1,2]
0
ghci> sum3 [1,2,3]
3
-}

{- Task 3 *

Analyze the function call countLower "Bob".

Follow the examples in silnia.pps and on the sites:

https://balois.pl/jipp/haskell/listy.htm
https://balois.pl/jipp/haskell/fold.htm
-}

{-
Analiza wywo�ania countLower "Bob":

1. Rozbijamy ci�g znak�w na list�:
   "Bob" � ['B', 'o', 'b']

2. Filtrujemy ma�e litery za pomoc� filter isLower:
   - 'B' � nie jest ma�� liter� � odrzucamy
   - 'o' � jest ma�� liter� � zostaje
   - 'b' � jest ma�� liter� � zostaje
   Wynik: ['o', 'b']

3. Liczymy d�ugo�� przefiltrowanej listy:
   length ['o', 'b'] � 2

Wynik ko�cowy:
countLower "Bob" = 2
-}

--4.3 Zdefiniuj funkcj� countLowerUpper, wyznaczaj�c� liczb� ma�ych i wielkich liter w przekazanym jej tek�cie wej�ciowym. Funkcja powinna by� nast�puj�cego typu countLowerUpper :: String � (Int, Int).

countLowerUpper :: String -> (Int, Int)
countLowerUpper [] = (0, 0)
countLowerUpper (x:xs) | 'a' <= x && x <= 'z' = (l + 1, u)
                       | 'A' <= x && x <= 'Z' = (l, u + 1)
                       | otherwise            = (l, u)
                       where (l, u) = countLowerUpper xs

{-
countLowerUpper ""
(0,0)
ghci> countLowerUpper "Ala mA KoTa"
(5,4)
-}

-- 4.4

{-
(*) Zdefiniuj funkcj� string2bools, kt�ra list� znak�w zast�puje list� warto�ci logicznych okre�laj�cych, czy oryginalny element by� ma�� liter�, czy te� nie. Funkcj� umie�� w module Lists.

Wskaz�wka:

Do modu�u Lists poni�ej s�owa where dodaj poni�sz� lini�:

import Data.Char
-}

string2bools :: String -> [Bool]
string2bools = map isLower

{-
ghci> string2bools ""
[]
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
1. Rozwijamy wywo�anie countLower "Bob":
   countLower "Bob"
   = length (filter isLower "Bob")

2. Funkcja filter isLower "Bob":
   "Bob" � ['B', 'o', 'b']

   - 'B' � NIE jest ma�� liter� � odrzucamy
   - 'o' � JEST ma�� liter� � zostaje
   - 'b' � JEST ma�� liter� � zostaje

   Wynik dzia�ania filter:
   = "ob" (lista ['o', 'b'])

3. Teraz obliczamy d�ugo�� wyniku:
   length "ob" = 2

Ostateczny wynik:
   countLower "Bob" = 2
-}

-- 4.5
{-
(*) funckja ltx list� element�w z listy wej�ciowych mniejszych lub r�wnych x.
(*) funkcja cltx liczb� element�w listy mniejszych od x;
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