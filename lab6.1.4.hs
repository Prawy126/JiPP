{- Task 1

Write the fourth program that presents the result in the form:

Enter natural number:
5
5! = 120

Finished. Press any key to exit...
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
        putStrLn (k ++ "! = " ++ show result)

{-
Enter natural number:
5
5! = 120
-}