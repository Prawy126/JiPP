-- 6.1.3

{-
Prelude> :t getLine
getLine :: IO String
-}

module Main
where

silnia :: Int -> Int
silnia n | n == 0 = 1
         | n > 0 = n * silnia (n - 1)
         
main =  
     do putStrLn "Enter natural number: "
        k <- getLine
        let result = silnia (read k)
        putStrLn (show result)
{-
Enter natural number:
5
120
-}