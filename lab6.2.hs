module Main where
 
import System.Environment
 
main = do
  [f,g] <- getArgs
  s <- readFile f
  writeFile g s