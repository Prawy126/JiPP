module Main where
 
import System.Environment

-- 6.2

main = do
  [f,g] <- getArgs
  s <- readFile f
  writeFile g s

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