module Main where

import System.Environment (getArgs)
import Data.List (isInfixOf)
--6.4

{-
(*) Napisz program sortfile sortuj�cy plik tekstowy. Program ma otrzymywa� dwa parametry z linii polece�: nazw� pliku do sortowania i nazw� pliku wynikowego.

Wskaz�wka: Skorzystaj z przedstawionych na wyk�adzie funkcji: mergeSort, lines i unlines.
-}

-- Prosty merge sort dla list
mergeSort :: Ord a => [a] -> [a]
mergeSort []  = []
mergeSort [x] = [x]
mergeSort xs  = merge (mergeSort left) (mergeSort right)
  where
    (left, right) = splitAt (length xs `div` 2) xs

    merge [] ys = ys
    merge xs [] = xs
    merge (x:xs) (y:ys)
      | x <= y    = x : merge xs (y:ys)
      | otherwise = y : merge (x:xs) ys

-- G��wna funkcja programu
main :: IO ()
main = do
  args <- getArgs
  case args of
    [inputFile, outputFile] -> do
      contents <- readFile inputFile
      let sortedLines = mergeSort (lines contents)
      writeFile outputFile (unlines sortedLines)
    _ -> putStrLn "Uzycie: sortfile <plik_wejsciowy> <plik_wyjsciowy>"


-- 6.5


main :: IO ()
main = do
  args <- getArgs
  case args of
    [word, fileName] -> do
      contents <- readFile fileName
      let ls = lines contents
          -- numerujemy linie od 1, filtrujemy te zawieraj�ce s�owo
          matchingLines = [i | (i, line) <- zip [1..] ls, word `isInfixOf` line]
      putStrLn "Znaleziono w liniach:"
      mapM_ print matchingLines
    _ -> putStrLn "Uzycie: searchFile <szukane_slowo> <plik>"

{- Task 2 *

Write two other definitions of function womenCount.
-}

-- Wersja 1 � Rekurencyjna (oryginalna)
womenCount1 :: [String] -> Int
womenCount1 [] = 0
womenCount1 ([_,_,_,_,_,_,_,_,_,p,_]:xs)
  | p `elem` "02468" = 1 + womenCount1 xs
  | otherwise        = womenCount1 xs

-- Wersja 2 � Z u�yciem filter i length
womenCount2 :: [String] -> Int
womenCount2 = length . filter (\p -> length p >= 11 && (p !! 9) `elem` "02468")

-- Wersja 3 � Z u�yciem list comprehension
womenCount3 :: [String] -> Int
womenCount3 pesels = sum [1 | p <- pesels, length p >= 11, p !! 9 `elem` "02468"]

-- Przyk�adowa lista PESEL-i do test�w
peselsTest :: [String]
peselsTest = ["53082806059", "89100192752", "85111779283"]  -- wynik: 1

-- G��wna funkcja
main :: IO ()
main = do
  [fileName] <- getArgs
  content <- readFile fileName
  let pesels = lines content
  putStrLn $ "Liczba kobiet (wersja 1): " ++ show (womenCount1 pesels)
  putStrLn $ "Liczba kobiet (wersja 2): " ++ show (womenCount2 pesels)
  putStrLn $ "Liczba kobiet (wersja 3): " ++ show (womenCount3 pesels)


-- 6.6.2

{-
Dany jest plik tekstowy pesel.txt zawieraj�cy numery PESEL z XX w. Napisz program, kt�ry:

wyznacza liczb� numer�w PESEL kobiet (przedostatnia liczba w kodzie jest parzysta);
(*) wyznacza liczb� os�b urodzonych w grudniu;
wyznacza liczb� os�b urodzonych w poszczeg�lnych dekadach (wynik jest list� 10-elementow�).
-}
-- Funkcja zliczaj�ca osoby urodzone w grudniu
decemberCount :: [[Char]] -> Int
decemberCount [] = 0
decemberCount (p:ps)
  | length p >= 4 && take 2 (drop 2 p) == "12" = 1 + decemberCount ps
  | otherwise = decemberCount ps

main = do
  [input] <- getArgs
  contents <- readFile input
  let pesels = lines contents
      women = womenCount pesels
      december = decemberCount pesels
      decades = decCount pesels [0,0,0,0,0,0,0,0,0,0]
  putStrLn ("number of women: " ++ show women)
  putStrLn ("number born in December: " ++ show december)
  putStrLn (printResult decades)


