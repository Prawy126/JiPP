module Lists where

import Data.Char
-- 4.7

{-
(*) suma od 1 do 1000 liczb postaci 1/(i^2);
(*) suma od 1 do 1000 liczb postaci (sqrt i)-1/i;
(*) iloczyn od 1 do 1000 liczb postaci (i+1)/(i^3).
-}

sum1 :: Double
sum1 = sum [1 / fromIntegral (i^2) | i <- [1..1000]]

sum2 :: Double
sum2 = sum [sqrt (fromIntegral i) - 1 / fromIntegral i | i <- [1..1000]]

prod1 :: Double
prod1 = product [(fromIntegral i + 1) / fromIntegral (i^3) | i <- [1..1000]]

{-
ghci> sum1
1.6439345666815615
ghci> sum2
21089.970416620185
ghci> prod1
0.0
ghci>
-}

-- 4.8

{-
W module Lists umie�� definicje funkcji factors i prime ze slajdu 45. Przetestuj ich dzia�anie. Przeanalizuj dzia�anie poni�szej funkcji:

primes :: [Integer]
primes = filter prime [2 ..]
Funkcj� umie�� w module Lists. Aby zatrzyma� obliczenia u�yj kombinacji Ctrl + C.

Do modu�u dodaj funkcj� pairs i przeanalizuj jej dzia�anie na przyk�adowych listach z liczbami ca�kowitymi:

pairs :: [Integer] -> [(Integer, Integer)]
pairs (x:y:[])  | x + 2 == y = [(x,y)]
                | otherwise  = []
pairs (x:y:xys) | x + 2 == y = (x,y) : pairs (y:xys)
                | otherwise  = pairs (y:xys)
(*) Zdefiniuj funkcj� primePairs zwracaj�c� list� par liczb pierwszych takich, �e drugi element pary jest wi�kszy o 2 od pierwszego.
(*) Zdefiniuj funkcj� primeTriples zwracaj�c� list� tr�jek liczb pierwszych takich, �e drugi element tr�jki jest wi�kszy o 2 od pierwszego, a trzeci jest wi�kszy o dwa od drugiego.
-}

primes :: [Integer]
primes = filter prime [2 ..]

factors :: Integer -> [Integer]
factors n = [x | x <- [1..n], n `mod` x == 0]

prime :: Integer -> Bool
prime n = factors n == [1,n]

{-
ghci> take 30 primes
[2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97,101,103,107,109,113]
ghci>
-}

pairs :: [Integer] -> [(Integer, Integer)]
pairs (x:y:[])  | x + 2 == y = [(x,y)]
                | otherwise  = []
pairs (x:y:xys) | x + 2 == y = (x,y) : pairs (y:xys)
                | otherwise  = pairs (y:xys)
{-
ghci> pairs [0,1]
[]
ghci> pairs [0,2]
[(0,2)]
ghci> pairs [0,2, 4, 5, 6]
[(0,2),(2,4)]
ghci> pairs [0,2, 4, 5, 7, 8, 10]
[(0,2),(2,4),(5,7),(8,10)]
-}

-- 4.8.1

primePairs :: [(Integer, Integer)]
primePairs = pairs primes
{-
ghci> primePairs
[(3,5),(5,7),(11,13),(17,19),(29,31),(41,43),(59,61),(71,73),(101,103),(107,109),(137,139),(149,151),(179,181),(191,193),(197,199),(227,229),(239,241),(269,271),(281,283),(311,313),(347,349),(419,421),(431,433),(461,463),(521,523),(569,571),(599,601),(617,619),(641,643),(659,661),(809,811),(821,823),(827,829),(857,859),(881,883),(1019,1021),(1031,1033),(1049,1051),(1061,1063),(1091,1093),(1151,1153),(1229,1231),(1277,1279),(1289,1291),(1301,1303),(1319,1321),(1427,1429),(1451,1453),(1481,1483),(1487,1489),(1607,1609),(1619,1621),(1667,1669),(1697,1699),(1721,1723),(1787,1789),(1871,1873),(1877,1879),(1931,1933),(1949,1951),(1997,1999),(2027,2029),(2081,2083),(2087,2089),(2111,2113),(2129,2131),(2141,2143),(2237,2239),(2267,2269),(2309,2311),(2339,2341),(2381,2383),(2549,2551),(2591,2593),(2657,2659),(2687,2689),(2711,2713),(2729,2731),(2789,2791),(2801,2803),(2969,2971),(2999,3001),(3119,3121),(3167,3169),(3251,3253),(3257,3259),(3299,3301),(3329,3331),(3359,3361),(3371,3373),(3389,3391),(3461,3463),(3467,3469),(3527,3529),(3539,3541),(3557,3559),(3581,3583),(3671,3673),(3767,3769),(3821,3823),(3851,3853),(3917,3919),(3929,3931),(4001,4003),(4019,4021),(4049,4051),(4091,4093),(4127,4129),(4157,4159),(4217,4219),(4229,4231),(4241,4243),(4259,4261),(4271,4273),(4337,4339),(4421,4423),(4481,4483),(4517,4519),(4547,4549),(4637,4639),(4649,4651),(4721,4723),(4787,4789),(4799,4801),(4931,4933),(4967,4969),(5009,5011),(5021,5023),(5099,5101),(5231,5233),(5279,5281),(5417,5419),(5441,5443),(5477,5479),(5501,5503),(5519,5521),(5639,5641),(5651,5653),(5657,5659),(5741,5743),(5849,5851),(5867,5869),(5879,5881),(6089,6091),(6131,6133),(6197,6199),(6269,6271),(6299,6301),(6359,6361),(6449,6451),(6551,6553),(6569,6571),(6659,6661),(6689,6691),(6701,6703),(6761,6763),(6779,6781),(6791,6793),(6827,6829),(6869,6871),(6947,6949),(6959,6961),(7127,7129),(7211,7213),(7307,7309),(7331,7333),(7349,7351),(7457,7459),(7487,7489),(7547,7549),(7559,7561),(7589,7591),(7757,7759),(7877,7879),(7949,7951),(8009,8011),(8087,8089),(8219,8221),(8231,8233),(8291,8293),(8387,8389),(8429,8431),Interrupted.
ghci>
-}

triples :: [Integer] -> [(Integer, Integer, Integer)]
triples [] = []
triples [x] = []
triples [x, y] = []
triples [x, y, z] | x == y - 2 && y == z - 2 = [(x, y, z)] 
                  | otherwise = []
triples (x:y:z:xs) | x == y - 2 && y == z - 2 = (x, y, z) : triples (y:z:xs)
                   | otherwise = triples (y:z:xs)
{-
ghci> triples []
[]
ghci> triples [1]
[]
ghci> triples [1, 2]
[]
ghci> triples [1, 2, 3]
[]
ghci> triples [0, 2, 4]
[(0,2,4)]
ghci> triples [0, 2, 4, 5, 6, 7, 8, 9]
[(0,2,4)]
ghci> triples [0, 2, 4, 6, 8, 9, 10]
[(0,2,4),(2,4,6),(4,6,8)]
-}

primeTriples :: [(Integer, Integer, Integer)]
primeTriples = triples primes
{-
 primeTriples
[(3,5,7)Interrupted.
ghci>
-}

-- 5.1

cubeRoot :: Double -> Double -> Double
cubeRoot x tolerance = until accepted improve 1
        where
            accepted y = abs (y^3 - x) <= tolerance 
            improve y = 1/3 * (2*y + x/(y^2))

{-
ghci> cubeRoot 27 0.0001
3.0000005410641766
ghci> cubeRoot 8 0.0001
2.0000049116755036
ghci> cubeRoot 125 0.01
5.000037942835659
ghci> cubeRoot 2 0.01
1.259933493449977
ghci>
