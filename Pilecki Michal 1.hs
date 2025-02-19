-- Homework 1

-- 1.1 - 2.5

{-
Task 4
Find description of rem and gcd functions in Haskell installation folder.

ghci> :i gcd
gcd :: Integral a => a -> a -> a 	-- Defined in ‘GHC.Real’
ghci> :i rem
type Integral :: * -> Constraint
class (Real a, Enum a) => Integral a where
  ...
  rem :: a -> a -> a
  ...
  	-- Defined in ‘GHC.Real’
infixl 7 `rem`
ghci> 
-}

{-
Task 6
Compile and run silnia.hs or factorial.hs file from the cmd command-line interpreter.

prawy126@prawy126-HP-Laptop-15-db1xxx:~/Desktop/nauka/JiPP$ ghc silnia.hs -o silnia
[2 of 2] Linking silnia
prawy126@prawy126-HP-Laptop-15-db1xxx:~/Desktop/nauka/JiPP$ ./silnia
Podaj liczbę naturalną: 
5
120
-}

{-
Task 2
Check the associativity and the strength of binding for operators: * / ^

GHCi, version 9.4.7: https://www.haskell.org/ghc/  :? for help
ghci> :i (*)
type Num :: * -> Constraint
class Num a where
  ...
  (*) :: a -> a -> a
  ...
  	-- Defined in ‘GHC.Num’
infixl 7 *
ghci> :i (/)
type Fractional :: * -> Constraint
class Num a => Fractional a where
  (/) :: a -> a -> a
  ...
  	-- Defined in ‘GHC.Real’
infixl 7 /
ghci> :i (^)
(^) :: (Num a, Integral b) => a -> b -> a 	-- Defined in ‘GHC.Real’
infixr 8 ^
ghci> 
-}

{-

Zadanie 2.3.3
objętość prostopadłościanu (cuboidVolume). 
-}
module Main where

cuboidVolume :: Double -> Double -> Double -> Double
cuboidVolume a b c = a * b * c

main :: IO ()
main = do
    putStrLn "Podaj długość prostopadłościanu: "
    a <- getLine
    putStrLn "Podaj szerokość prostopadłościanu: "
    b <- getLine
    putStrLn "Podaj wysokość prostopadłościanu: "
    c <- getLine
    let volume = cuboidVolume (read a) (read b) (read c)
    putStrLn ("Objętość prostopadłościanu: " ++ show volume)

{-

prawy126@prawy126-HP-Laptop-15-db1xxx:~/Desktop/nauka/JiPP$ ghc -o test Pilecki\ Michal\ 1.hs 
[1 of 2] Compiling Main             ( Pilecki Michal 1.hs, Pilecki Michal 1.o )
[2 of 2] Linking test
prawy126@prawy126-HP-Laptop-15-db1xxx:~/Desktop/nauka/JiPP$ ./test
Podaj długość prostopadłościanu: 
23
Podaj szerokość prostopadłościanu: 
12
Podaj wysokość prostopadłościanu: 
32
Objętość prostopadłościanu: 8832.0
prawy126@prawy126-HP-Laptop-15-db1xxx:~/Desktop/nauka/JiPP$ 
-}

{-

2.5
Do modułu Solids dopisz funkcję wyznaczającą objętość ostrosłupa o podstawie kwadratowej (pyramidVolume). Przetestuj działanie tej funkcji. 
-}

module Solids where

-- 2.4
sphereVolume :: Floating a => a -> a
sphereVolume r = 4/3 * pi * r^3

coneVolume :: Floating a => a -> a -> a
coneVolume r h = 1/3 * pi * r^2 * h

pyramidVolume :: Floating a => a -> a -> a
pyramidVolume a h = 1/3 * a^2 * h


{-
ghci> :l solids.hs
[1 of 1] Compiling Solids           ( solids.hs, interpreted )
Ok, one module loaded.
ghci> pyramidVolume 4 9
48.0
ghci> 
-}