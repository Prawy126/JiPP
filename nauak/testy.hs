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

data Tree = Leaf Int 
          | Node Tree Tree deriving Show

gtx4tree :: Int -> Tree -> [Int]
gtx4tree x (Leaf n)
         | n>x = [x]
         | otherwise = []
gtx4tree x (Node l r) = gtx4tree x l ++ gtx4tree x r

mojeDrzewo = Node (Node (Leaf 2) (Leaf 7)) (Leaf 5)


reverseString :: String -> String
reverseString [] = []
reverseString (x:xs) = reverseString xs ++ [x]

sumGT :: Int -> Tree -> Int
sumGT x (Leaf n)
      | n > x = n
      | otherwise = 0
sumGT x (Node l r) = sumGT x l + sumGT x r

walec r h = pi * (r ^ 2) * h
walec1  = (*) . (pi *) . (^2)

trapez a b h = ((a + b) * h)/2
--trapez1 = (/ 2) . uncurry ((*) . (+))

stozek r h = pi * (r ^ 2) * h / 3
stozek1 = ((/3).).((*).(pi *).(^2))