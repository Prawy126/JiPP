import Data.Char

-- Tradycyjna wersja (formuła Herona)
areaHeron :: Double -> Double -> Double -> Double
areaHeron a b c = sqrt (s * (s - a) * (s - b) * (s - c))
  where s = (a + b + c) / 2

-- Wersja z użyciem sekcji (przykład: podstawa i wysokość)
areaSection :: Double -> Double -> Double
areaSection base height = (base * height) / 2

byte2int :: String -> Int
byte2int (c1:c2:[]) = dec c1 * 16 + dec c2
byte2int _ = error "Niepoprawny ciąg"

dec :: Char -> Int
dec x | x `elem` ['0'..'9'] = ord x - ord '0'
      | x `elem` ['A'..'F'] = ord x - ord 'A' + 10
      | x `elem` ['a'..'f'] = ord x - ord 'a' + 10
      | otherwise = error "Niepoprawny znak"

(**.) :: (Double, Double) -> (Double, Double) -> (Double, Double)
(a, b) **. (c, d) = (a*c - b*d, a*d + b*c)

infixl 7 **.

digits :: Integer -> Integer
digits 0 = 1
digits x = 1 + digits (abs x `quot` 10)

data Tree a = Leaf a | Node a (Tree a) (Tree a) | Null deriving Show

addOddNodes :: Integral a => Tree a -> a
addOddNodes Null = 0
addOddNodes (Leaf x) = if odd x then x else 0
addOddNodes (Node x left right) = 
  (if odd x then x else 0) + addOddNodes left + addOddNodes right