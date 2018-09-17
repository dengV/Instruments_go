boomBangs xs = [if x < 10 then "BOOM" else "BANG!" | x <- xs, odd x]



quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x: xs) = 
    let smallerOrEqual = [a | a <- xs, a <= x] 
        larger = [a | a <- xs , a > x]
    in quicksort smallerOrEqual ++ [x] ++ quicksort larger




