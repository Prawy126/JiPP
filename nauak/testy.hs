import Data.Char
import Data.List (foldl')

areaEllipse :: Double -> Double -> Double
areaEllipse a b = pi * a * b
areaEllipse1  = (*) . (*pi)

rownoleglobok a b = a * b
rownoleglobok1 a = (a *)

isDecByte :: Int -> Bool
isDecByte x = x >= 0 && x <= 255

infix 4 .*
(.*):: (Double, Double, Double) -> (Double, Double, Double) -> Double
(x1,y1,z1) .* (x2,y2,z2) = x1*x2 + y1*y2 + z1*z2

primes :: Int -> [Int]
primes n = aux [2..n]

aux :: [Int] -> [Int]
aux [] = []
aux(x:xs) = x : aux(filter (\y -> y `mod` x /= 0) xs)

reverseString :: String -> String
reverseString [] = []
reverseString (x:xs) = reverseString xs ++ [x]

walec r h = pi * (r ^ 2) * h
walec1  = (*) . (pi *) . (^2)

trapez a b h = ((a + b) * h)/2
--trapez1 = (/ 2) . uncurry ((*) . (+))

stozek r h = pi * (r ^ 2) * h / 3
stozek1 = ((/3).).((*).(pi *).(^2))

-- Drzewa

data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null

-- Przyk³adowe wêz³y
bt1 = Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Leaf 10)
 
bt2 = Node 7 (Node 4 (Leaf 2) (Leaf 5)) 
             (Node 10 (Leaf 9) (Node 13 (Leaf 11) (Leaf 15)))
 
bt3 = Node 7 (Leaf 1) Null

-- Liczenie liczby wêz³ów

countNodes :: Tree a -> Int
countNodes Null = 0
countNodes (Leaf _) = 0
countNodes (Node _ l r) = 1 + countNodes l + countNodes r


-- Liczenie lisci
countLeaves :: Tree a -> Int
countLeaves Null = 0
countLeaves (Leaf _) = 1
countLeaves (Node _ l r) = countLeaves l + countLeaves r

-- Sumowanie wartosci drzewa
sumTree :: Num a => Tree a -> a
sumTree Null = 0
sumTree (Leaf x) = x
sumTree (Node x l r) = x + sumTree l + sumTree r

--Sprawdzanie g³êbokoœci drzewa
depth :: Tree a -> Int
depth Null = 0
depth (Leaf _) = 1
depth (Node _ l r) = 1 + max (depth l) (depth r)

-- Suma jeœli wartoœæ jest wiêksza od liczby podanej przez u¿ytkownika

countGreaterThan :: Ord a => a -> Tree a -> Int
countGreaterThan _ Null = 0
countGreaterThan x (Leaf val)
  | val > x   = 1
  | otherwise = 0
countGreaterThan x (Node val left right)
  | val > x   = 1 + countGreaterThan x left + countGreaterThan x right
  | otherwise = countGreaterThan x left + countGreaterThan x right
  
-- Suma liczb nieparzystych z drzewa
addOddNodes :: Integral a => Tree a -> a
addOddNodes Null = 0
addOddNodes (Leaf x) | x `mod` 2 == 0 = x
                     | otherwise = 0
addOddNodes(Node x left right) | x `mod` 2 == 0 = x + addOddNodes left + addOddNodes right
                               | otherwise = addOddNodes left + addOddNodes right


byte2int :: String -> Int
byte2int [a,b] = dec a * 16 + dec b
byte2int [a] = dec a
byte2int [] = error "Lista jest pusta"

dec x | elem x ['0'..'9'] = ord x - ord '0'
      | elem x ['a'..'f'] = 10 + ord x - ord 'a'
      | elem x ['A'..'F'] = 10 + ord x - ord 'A'
      
string2int :: String -> Int
string2int [a,b,c] = dec1 a * 100 + dec1 b * 10 + dec1 c
string2int [a,b] = dec1 a * 10 + dec1 b
string2int [a] = dec1 a

dec1 x | elem x ['0'..'9'] = ord x - ord '0'

sumList :: [Int] -> Int
sumList = foldl' (+) 0