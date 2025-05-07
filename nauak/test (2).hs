import Data.Char

f1 :: Double -> Double -> Double 
f1 a h = (a*h) / 2

f2 :: Double -> Double -> Double -> Double
f2 a b c = sqrt( s * (s - a) * (s - b) * (s - c)) 
  where s = (a + b + c) / 2

hex2int :: String -> Int
hex2int s = foldl (\acc c -> acc * 16 + val c) 0s
  where 
   val c
     | c `elem` ['0'..'9'] = ord c - ord '0'
     | c `elem` ['a'..'f'] = ord c - ord 'a' + 10
     | c `elem` ['A'..'F'] = ord c - ord 'A' + 10

(*.) :: (Double,Double) -> (Double, Double) -> (Double,Double)
(a,b) *. (c,d) = (a * c - b * d, a * d + b * c)

digits :: Integer -> Integer
digits 0 = 0
digits x = 1 + digits (abs x `quot` 10)

data Tree a = Leaf a | Node a (Tree a) (Tree a) | Null

addOddNodes :: Integral a => Tree a -> a
addOddNodes Null = 0
addOddNodes (Leaf x) | odd x = x  | otherwise = 0
addOddNodes (Node x left right) | odd x = x + addOddNodes left + addOddNodes right  | otherwise = 0 + addOddNodes left + addOddNodes right

testTree = Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Leaf 10)

-- kolejna grupa

f3 :: Double -> Double -> Double
f3 a b = a * b

f4 :: Double -> Double -> Double
f4 = (*)

isHexByte :: String -> Bool
isHexByte = all hexDigit

hexDigit x = x `elem` ['0'..'9'] ++ ['a'..'f'] ++ ['A'..'F']

(**.) :: (Double, Double, Double) -> (Double, Double, Double) -> (Double, Double, Double)
(a, b, c) **. (d, e, f) = (a * d, b * e, c * f)

factors :: Int -> [Int]
factors n = go 1
  where 
    go k
      | k > n = []
      | n `mod` k == 0 = k : go (k + 1)
      | otherwise = go (k + 1)

evenLeafs :: Integral a => Tree a -> [a]
evenLeafs Null = []
evenLeafs (Leaf x)
  | even x = [x]
  | otherwise = []
evenLeafs (Node _ left right) = evenLeafs left ++ evenLeafs right
