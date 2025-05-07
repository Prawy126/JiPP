<<<<<<< HEAD
module Main where

import System.Environment
import Data.Char

decCount :: [[Char]] -> [Int] -> [Int]
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

main = do 
  [input] <- getArgs
  inText <- readFile input
  let counter = decCount (lines inText) [0,0,0,0,0,0,0,0,0,0]
  putStrLn (printResult counter)
 
{-
How to convert a character into the string?
How to convert a string into the character?

What is the type of function decCount?
What is the type of parameters a and b?
What is the type of expression [a,b]?

What is the purpose of the second argument of function decCount?
-}

{-
*Main> ['A']
"A"
*Main> 'A' : []
"A"
*Main> head "A"
'A'
*Main> "A" !! 0
'A'
=======
module Main where

import System.Environment
import Data.Char

decCount :: [[Char]] -> [Int] -> [Int]
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

main = do 
  [input] <- getArgs
  inText <- readFile input
  let counter = decCount (lines inText) [0,0,0,0,0,0,0,0,0,0]
  putStrLn (printResult counter)
 
{-
How to convert a character into the string?
How to convert a string into the character?

What is the type of function decCount?
What is the type of parameters a and b?
What is the type of expression [a,b]?

What is the purpose of the second argument of function decCount?
-}

{-
*Main> ['A']
"A"
*Main> 'A' : []
"A"
*Main> head "A"
'A'
*Main> "A" !! 0
'A'
>>>>>>> refs/remotes/origin/main
-}