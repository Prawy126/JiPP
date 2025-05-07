module Main where

import System.Environment
import Data.Char

--6.4

{-
(*) Napisz program sortfile sortuj¹cy plik tekstowy. Program ma otrzymywaæ dwa parametry z linii poleceñ: nazwê pliku do sortowania i nazwê pliku wynikowego.

Wskazówka: Skorzystaj z przedstawionych na wyk³adzie funkcji: mergeSort, lines i unlines.
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

-- G³ówna funkcja programu
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

{-
(*) Napisz program searchFile, który przeszukuje plik tekstowy i zwraca numery linii, w których znalaz³ szukane s³owo. Program ma otrzymywaæ dwa parametry z linii poleceñ: szukane s³owo i nazwê pliku.
-}

main :: IO ()
main = do
  args <- getArgs
  case args of
    [word, fileName] -> do
      contents <- readFile fileName
      let ls = lines contents
          matchingLines = [i | (i, line) <- zip [1..] ls, word `isInfixOf` line]
      putStrLn "Znaleziono w liniach:"
      mapM_ print matchingLines
    _ -> putStrLn "Uzycie: searchFile <szukane_slowo> <plik>"

{- Task 2 *

Write two other definitions of function womenCount.
-}

-- Wersja 1 – Rekurencyjna (oryginalna)
womenCount1 :: [String] -> Int
womenCount1 [] = 0
womenCount1 ([_,_,_,_,_,_,_,_,_,p,_]:xs)
  | p `elem` "02468" = 1 + womenCount1 xs
  | otherwise        = womenCount1 xs

-- Wersja 2 – Z u¿yciem filter i length
womenCount2 :: [String] -> Int
womenCount2 = length . filter (\p -> length p >= 11 && (p !! 9) `elem` "02468")

-- Wersja 3 – Z u¿yciem list comprehension
womenCount3 :: [String] -> Int
womenCount3 pesels = sum [1 | p <- pesels, length p >= 11, p !! 9 `elem` "02468"]

-- G³ówna funkcja
main :: IO ()
main = do
  [fileName] <- getArgs
  content <- readFile fileName
  let pesels = lines content
  putStrLn $ "Liczba kobiet (wersja 1): " ++ show (womenCount1 pesels)
  putStrLn $ "Liczba kobiet (wersja 2): " ++ show (womenCount2 pesels)
  putStrLn $ "Liczba kobiet (wersja 3): " ++ show (womenCount3 pesels)

{-
Liczba kobiet (wersja 1): 74
Liczba kobiet (wersja 2): 74
Liczba kobiet (wersja 3): 74

-}
-- 6.6.2

{-
Dany jest plik tekstowy pesel.txt zawieraj¹cy numery PESEL z XX w. Napisz program, który:

wyznacza liczbê numerów PESEL kobiet (przedostatnia liczba w kodzie jest parzysta);
(*) wyznacza liczbê osób urodzonych w grudniu;
wyznacza liczbê osób urodzonych w poszczególnych dekadach (wynik jest list¹ 10-elementow¹).
-}

womenCount :: [String] -> Int
womenCount [] = 0
womenCount (p:ps)
  | length p >= 11 && (p !! 9) `elem` "02468" = 1 + womenCount ps
  | otherwise = womenCount ps

decemberCount :: [String] -> Int
decemberCount [] = 0
decemberCount (p:ps)
  | length p >= 4 && take 2 (drop 2 p) == "12" = 1 + decemberCount ps
  | otherwise = decemberCount ps

decCount :: [String] -> [Int] -> [Int]
decCount [] ds = ds
decCount ([a,b,_,_,_,_,_,_,_,_,_]:xs) [d1,d2,d3,d4,d5,d6,d7,d8,d9,d10]
  | n > 0  && n <= 10 = decCount xs [d1+1,d2,d3,d4,d5,d6,d7,d8,d9,d10]
  | n > 10 && n <= 20 = decCount xs [d1,d2+1,d3,d4,d5,d6,d7,d8,d9,d10]
  | n > 20 && n <= 30 = decCount xs [d1,d2,d3+1,d4,d5,d6,d7,d8,d9,d10]
  | n > 30 && n <= 40 = decCount xs [d1,d2,d3,d4+1,d5,d6,d7,d8,d9,d10]
  | n > 40 && n <= 50 = decCount xs [d1,d2,d3,d4,d5+1,d6,d7,d8,d9,d10]
  | n > 50 && n <= 60 = decCount xs [d1,d2,d3,d4,d5,d6+1,d7,d8,d9,d10]
  | n > 60 && n <= 70 = decCount xs [d1,d2,d3,d4,d5,d6,d7+1,d8,d9,d10]
  | n > 70 && n <= 80 = decCount xs [d1,d2,d3,d4,d5,d6,d7,d8+1,d9,d10]
  | n > 80 && n <= 90 = decCount xs [d1,d2,d3,d4,d5,d6,d7,d8,d9+1,d10]
  | n > 90 || n == 0  = decCount xs [d1,d2,d3,d4,d5,d6,d7,d8,d9,d10+1]
  where n = read [a,b]

printResult :: [Int] -> String
printResult [d1,d2,d3,d4,d5,d6,d7,d8,d9,d10] =
  "1901 - 1910: " ++ (show d1) ++
  "\n1911 - 1920: " ++ (show d2) ++
  "\n1921 - 1930: " ++ (show d3) ++
  "\n1931 - 1940: " ++ (show d4) ++
  "\n1941 - 1950: " ++ (show d5) ++
  "\n1951 - 1960: " ++ (show d6) ++
  "\n1961 - 1970: " ++ (show d7) ++
  "\n1971 - 1980: " ++ (show d8) ++
  "\n1981 - 1990: " ++ (show d9) ++
  "\n1991 - 2000: " ++ (show d10)

main :: IO ()
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

{-
number of women: 74
number born in December: 20
1901 - 1910: 0
1911 - 1920: 0
1921 - 1930: 0
1931 - 1940: 0
1941 - 1950: 3
1951 - 1960: 21
1961 - 1970: 30
1971 - 1980: 32
1981 - 1990: 60
1991 - 2000: 4

Finished. Press any key to exit...
-}