<<<<<<< HEAD
-- 6.6.1
import System.Environment
{-
*Main> :t  elem
elem :: (Eq a, Foldable t) => a -> t a -> Bool
*Main> elem 1 [1,3,5]
True
*Main> elem 2 [1,3,5]
False
*Main> let f [a,b,_] = (a,b)
*Main> f "cat"
('c','a')
*Main> f "zonk"
*** Exception: <interactive>:4:5-21: Non-exhaustive patterns in fun

*Main> lines "It is the first line.\nIt is the second line."
["It is the first line.","It is the second line."]
-}

womenCount :: [[Char]] -> Int
womenCount [] = 0
womenCount ([_,_,_,_,_,_,_,_,_,p,_]:xs) | elem p "02468" = 1 + womenCount xs
                                        | otherwise = womenCount xs
                                        
pesels = ["53082806059", "89100192752", "85111779283"]

{-
*Main> womenCount pesels
1
-}

main = do
     [input] <- getArgs
     pesels <- readFile  input
     let wc = womenCount (lines pesels)
     putStrLn ("number of women: " ++ show wc)
     
{-
number of women: 74
=======
-- 6.6.1
import System.Environment
{-
*Main> :t  elem
elem :: (Eq a, Foldable t) => a -> t a -> Bool
*Main> elem 1 [1,3,5]
True
*Main> elem 2 [1,3,5]
False
*Main> let f [a,b,_] = (a,b)
*Main> f "cat"
('c','a')
*Main> f "zonk"
*** Exception: <interactive>:4:5-21: Non-exhaustive patterns in fun

*Main> lines "It is the first line.\nIt is the second line."
["It is the first line.","It is the second line."]
-}

womenCount :: [[Char]] -> Int
womenCount [] = 0
womenCount ([_,_,_,_,_,_,_,_,_,p,_]:xs) | elem p "02468" = 1 + womenCount xs
                                        | otherwise = womenCount xs
                                        
pesels = ["53082806059", "89100192752", "85111779283"]

{-
*Main> womenCount pesels
1
-}

main = do
     [input] <- getArgs
     pesels <- readFile  input
     let wc = womenCount (lines pesels)
     putStrLn ("number of women: " ++ show wc)
     
{-
number of women: 74
>>>>>>> refs/remotes/origin/main
-}