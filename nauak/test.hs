leg :: Int -> Int -> Int
leg a b | a < b = 1
        | a > b = -1
        | a == b = 0 
        
zespolona :: [Double] -> [Double] -> [Double]
zespolona [a, b] [c, d] = [a * c - b * d, a * d + b * c]

f :: [a] -> [a]
f [] = []
f [_] = []
f (_:x:xs) = x : f xs

sumExpression :: Double
sumExpression = sum [2/(i^2+1)|i<-[1..2000]]

productExpression :: Double
productExpression = product [sin x * cos x | x <- [20..45]]

data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null

sumTree :: Num a => Tree a -> a
sumTree Null = 0
sumTree (Leaf x) = x
sumTree (Node x left right) = x + sumTree left + sumTree right
tree = Node 1 (Leaf 2) (Node 3 (Leaf 4) Null)

