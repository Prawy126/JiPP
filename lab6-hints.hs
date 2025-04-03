-- 6.1

-- slide 70/71

{-                                          
Here are suggested names for the source files:

lab6.1.1.hs
lab6.1.2.hs
lab6.1.3.hs

If the name consists of a dot, you should add the extension .hs on saving.
If not stated otherwise, the other tasks should follow this naming scheme.
-}

{-
*Main> :t putStrLn
putStrLn :: String -> IO ()
*Main> :t readLn
readLn :: Read a => IO a
*Main> :t print
print :: Show a => a -> IO ()
*Main> :t read
read :: Read a => String -> a
*Main> :t show
show :: Show a => a -> String
-}

-- an example run of the first program

{-
Enter natural number:
5
120

Finished. Press any key to exit...
-}

{- Task 1

Write the fourth program that presents the result in the form:

Enter natural number:
5
5! = 120

Finished. Press any key to exit...
-}

-- 6.2

{-
*Main> :t readFile
readFile :: FilePath -> IO String
*Main> :t writeFile
writeFile :: FilePath -> String -> IO ()
*Main> :m +System.Environment
*Main System.Environment> :t getArgs
getArgs :: IO [String]
-}

{-
How many arguments does the function readFile take?
How many arguments does the function writeFile take?
How many arguments does the function getArgs take?

What is the type of the result of function readFile?
What is the type of the result of function writeFile?
What is the type of the result of function getArgs?
-}

{-
Create an example text file file1.txt and with the use of 
the application copy its contents to the file file2.txt
-}

-- 6.3

{-
*Main> 'a' == 'a'
True
*Main> 'A' == 'a'
False
*Main> 'c' : "at"
"cat"
*Main> let f (x:xs) = (x,xs)
*Main> f "cat"
('c',"at")
-}

{-
Consider two branches of the clear function with flags:

False - to be invoked if the current character is outside an html tag
True  - to be invoked if the current character is inside an html tag
-}

clear :: String -> Bool -> String
-- complete the definition

{-
clear :: String -> Bool -> String
clear ...
clear ... False | if we get '<' then we omit it and change the mode of operation
                | otherwise, we add the current char to the result and continue
clear ... True | if we get '>' then we omit it and change the mode of operation
               | otherwise, we omit the current char and continue
-}

{-
*Main> clear "" False
""
*Main> clear "" True
""
*Main> clear "It is a sentence." False
"It is a sentence."
*Main> clear "It is a sentence." True
""
*Main> clear "<p>It is a paragraph." False
"It is a paragraph."
*Main> clear "<p>It is a paragraph." True
"It is a paragraph."
-}

{-
The suggested names of variables in function main are: input, output, html, text

Download the following html file and test with it html2txt application.

http://www.balois.pl/jipp/index.htm
-}

-- 6.4 *

-- homework

-- 6.5 *

-- homework

-- 6.6.1

-- slide 49/71

{-
*Main> :t elem
elem :: (Eq a, Foldable t) => a -> t a -> Bool
*Main> elem 1 [1,3,5]
True
*Main> elem 2 [1,3,5]
False
*Main> let f [a,b,_] = (a, b)
*Main> f "cat"
('c','a')
*Main> f "zonk"
*** Exception: <interactive>:19:5-22: Non-exhaustive patterns in function f

*Main> lines "It is the first line.\nIt is the second line."
["It is the first line.","It is the second line."]
-}

womenCount :: [[Char]] -> Int
-- complete the definition

{-
What is the type of function womenCount?
-}

-- the output of the program:

{-
number of women: 74

Finished. Press any key to exit...
-}

{- Task 2 *

Write two other definitions of function womenCount.
-}

-- 6.6.2 *

-- homework

-- 6.6.3

decCount :: [[Char]] -> [Int] -> [Int]
decCount [] ds = ds
decCount ([a,b,_,_,_,_,_,_,_,_,_]:xs) [d1,d2,d3,d4,d5,d6,d7,d8,d9,d10]
-- complete the definition

{-
How to convert a character into the string?
How to convert a string into the character?

What is the type of function decCount?
What is the type of parameters a and b?
What is the type of expression [a,b]?

What is the purpose of the second argument of function decCount?
-}

-- the output of the program:

{-
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