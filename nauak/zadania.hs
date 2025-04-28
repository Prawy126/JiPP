import Data.Char

-- 2 gr
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


digits :: Integer -> Integer
digits 0 = 1
digits x = 1 + digits (abs x `quot` 10)

data Tree a = Leaf a | Node a (Tree a) (Tree a) | Null deriving Show

addOddNodes :: Integral a => Tree a -> a
addOddNodes Null = 0
addOddNodes (Leaf x) = if odd x then x else 0
addOddNodes (Node x left right) = 
  (if odd x then x else 0) + addOddNodes left + addOddNodes right


-- 1 gr

-- Tradycyjna wersja
areaRect :: Double -> Double -> Double
areaRect length width = length * width

-- Wersja z użyciem sekcji
areaSection2 :: Double -> Double -> Double
areaSection2 = (*) -- (*) jest sekcją operatora mnożenia

hexDigit :: Char -> Bool
hexDigit x = x `elem` ['0'..'9'] ++ ['a'..'f'] ++ ['A'..'F']

isHexByte :: String -> Bool
isHexByte [c1, c2] = hexDigit c1 && hexDigit c2
isHexByte _ = False

(***.) :: (Double, Double, Double) -> (Double, Double, Double) -> Double
(a, b, c) ***. (d, e, f) = a*d + b*e + c*f


factors :: Int -> [Int]
factors n = aux n n
  where
    aux 1 m = [1]
    aux k m
      | m `mod` k == 0 = k : aux (k-1) m
      | otherwise = aux (k-1) m

evenLeafs :: Integral a => Tree a -> [a]
evenLeafs Null = []
evenLeafs (Leaf x) = if even x then [x] else []
evenLeafs (Node _ left right) = evenLeafs left ++ evenLeafs right
