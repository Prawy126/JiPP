-- Homework 1

-- 1.1 - 2.5

{-

Zadanie 1.2
(*) Pobierz plik pliki.c, przeanalizuj jego zawartość, skompiluj i przetestuj jego działanie.
-}
#include <stdio.h>

int main() 
{
  int a, b, c;
  FILE *in, *out;
  in = fopen("liczby.txt", "r");
  out = fopen("wynik.txt", "w");
  
  fscanf(in, "%d%d", &a, &b);
  c = a + b;
  fprintf(out, "%d", c);
  
  fclose(in);
  fclose(out);
  return 0;
}

{-

Jest to prosty program, który odczytuje z pliku liczby.txt 2 liczby a potem sumuje je i zapisuje wynik do pliku wyniki.txt
-}

{-

Zadanie 1.4
Java
(*)

Uruchom środowisko NetBeans.
Utwórz nowy projekt (Java → Java Application).
Uzupełnij funkcję main o kod, w którym tworzona jest 10-elementowa tablica liczb całkowitych, wypełniana jest liczbami losowymi z zakresu 1..6 i jej zawartość jest wyświetlana na terminalu.
Skompiluj i przetestuj działanie aplikacji.
-}

import java.util.Random;

public class Main {
    public static void main(String[] args) {
        int tablica[] = new int[10];
        Random random = new Random();
        for(int i = 0; i < tablica.length; i++){
            tablica[i] = random.nextInt(5)+1;
        }

        for(int i = 0; i < tablica.length; i++){
            System.out.print(tablica[i]+" ");
        }
    }
}

{-

C:\Users\Lenovo\.jdks\openjdk-22.0.2\bin\java.exe "-javaagent:C:\Program Files\JetBrains\IntelliJ IDEA Community Edition 2024.1.4\lib\idea_rt.jar=62012:C:\Program Files\JetBrains\IntelliJ IDEA Community Edition 2024.1.4\bin" -Dfile.encoding=UTF-8 -Dsun.stdout.encoding=UTF-8 -Dsun.stderr.encoding=UTF-8 -classpath C:\Users\Lenovo\Desktop\nauka\JiPP\Zadanie1_5\out\production\Zadanie1_5 Main
5 5 1 1 5 4 4 5 4 2 
Process finished with exit code 0
-}

{-

Zadanie 1.5
Java
(*) Napisz aplikację realizującą te same obliczenia co aplikacja z zadania 1.2, ale używając język Java.
-}

import java.io.*;
import java.util.Scanner;

public class Main2 {
    public static void main(String[] args) {
        int a, b, c;

        try {
            File inFile = new File("liczby.txt");
            Scanner scanner = new Scanner(inFile);

            a = scanner.nextInt();
            b = scanner.nextInt();
            scanner.close();

            c = a + b;

            FileWriter outFile = new FileWriter("wynik.txt");
            outFile.write(Integer.toString(c));
            outFile.close();

            System.out.println("Wynik zapisany do pliku wynik.txt");

        } catch (IOException e) {
            System.out.println("Błąd podczas operacji na plikach!");
            e.printStackTrace();
        }
    }
}

{-

C:\Users\Lenovo\.jdks\openjdk-22.0.2\bin\java.exe "-javaagent:C:\Program Files\JetBrains\IntelliJ IDEA Community Edition 2024.1.4\lib\idea_rt.jar=62073:C:\Program Files\JetBrains\IntelliJ IDEA Community Edition 2024.1.4\bin" -Dfile.encoding=UTF-8 -Dsun.stdout.encoding=UTF-8 -Dsun.stderr.encoding=UTF-8 -classpath C:\Users\Lenovo\Desktop\nauka\JiPP\Zadanie1_5\out\production\Zadanie1_5 Main2
Wynik zapisany do pliku wynik.txt

Process finished with exit code 0

liczby.txt
23123 6985

wynik.txt
30108
-}

{-

Task 4
Find description of rem and gcd functions in Haskell installation folder.
-}

{-

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
-}

{-

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
-}

{-

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
Aby sprawdzić, czy 113 jest liczbą pierwszą, wystarczy sprawdzić, czy nie dzieli się przez żadną liczbę od 2 do sqrt(113).
Zadanie 2.2.2
(*) Korzystając z funkcji rem sprawdza, czy 113 jest liczbę pierwszą.
-}

{-

 ghci> sqrt 113
10.63014581273465
ghci> rem 113 2
1
ghci> rem 113 3
2
ghci> rem 113 4
1
ghci> rem 113 5
3
ghci> rem 113 6
5
ghci> rem 113 7
1
ghci> rem 113 8
1
ghci> rem 113 9
5
ghci> rem 113 10
3
ghci> rem 113 11
3
ghci> rem 113 1
0
ghci> rem 113 113
0
ghci>
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