-- 2.4
sphereVolume :: Floating a => a -> a -> a
sphereVolume r = 4/3 * pi * r^3

coneVolume :: Floating a => a -> a -> a
coneVolume r h = 1/3 * pi * r^2 * h