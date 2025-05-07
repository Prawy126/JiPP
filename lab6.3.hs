import System.Environment

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
clear [] _ = []
clear (x:xs) False | x == '<' = clear xs True
                   | otherwise = x : clear xs False
clear (x:xs) True | x =='>' = clear xs False
                  | otherwise = clear xs True

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
*Main> clear "it is a sentence." False
"it is a sentence."
*Main> clear "it is a sentence." True
""
*Main> clear "<p>it is a sentence." False
"it is a sentence."
*Main> clear "<p>it is a sentence." True
"it is a sentence."
-}


{-
The suggested names of variables in function main are: input, output, html, text

Download the following html file and test with it html2txt application.

http://www.balois.pl/jipp/index.htm
-}


main = do
     [input, output] <- getArgs
     html <- readFile  input
     let text = clear html True 
     writeFile output text