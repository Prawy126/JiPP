-- 6.1.1
{-
Prelude> :t putStrLn
putStrLn :: String -> IO ()
Prelude> putStrLn "ala"
ala
Prelude> :t readLn
readLn :: Read a => IO a
Prelude> :t print
print :: Show a => a -> IO ()
Prelude> :t read
read :: Read a => String -> a
Prelude> :t show
show :: Show a => a -> String
Prelude> show 5
"5"
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
        k <- readLn
        let result = silnia k
        print result
        
{-
Enter natural number:
4
24
-}
