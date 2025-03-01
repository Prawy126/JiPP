module Triangle where

{-
2.6
(*) f5 zwraca True, je�eli argument jest wi�kszy od 100 i False w przeciwnym przypadku;
(*) f6 zwraca reszt� z dzielenia liczby 5 przez argument funkcji;
(*) f7 zwraca cz�� ca�kowit� z dzielenia liczby 8 przez argument funkcji;
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
Zdefiniuj modu� Triangle i umie�� w nim definicje funkcji trArea1, trArea2 i trArea3, kt�re wyznaczaj� pole powierzchni tr�jk�ta, przy czym ka�da z tych funkcji wykorzystuje inny wz�r na pole tr�jk�ta.
-}

-- Pole tr�jk�ta przy u�yciu podstawy i wysoko�ci
trArea1 :: Floating a => a -> a -> a
trArea1 base height = 0.5 * base * height

-- Pole tr�jk�ta przy u�yciu wzoru Herona (dla trzech bok�w)
trArea2 :: Floating a => a -> a -> a -> a
trArea2 a b c =
  let s = (a + b + c) / 2
  in sqrt (s * (s - a) * (s - b) * (s - c))

-- Pole tr�jk�ta przy u�yciu dw�ch bok�w i k�ta (k�t w radianach)
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