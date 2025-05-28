
sumList :: Int -> Int
sumList n = sum [2,4 .. 2 * n]

sumList2 n = foldr (+) 0 [2,4..2*n]

sumaR :: Int -> Double
sumaR 0 = 0
sumaR n 
  | n > 0   = 1 / fromIntegral (n^2) + sumaR (n - 1)
  | otherwise = error "Błąd: n musi być większe od zera"

trojkat = (*).(/2)

trapez a b h = ((a + b)/2)*h
trapez' a b = (((a + b) /2) *)
