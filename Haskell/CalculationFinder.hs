powerset [] = [[]]
powerset (head:tail) = subset ++ map (head:) subset
                 where subset = powerset tail

stringToInteger string = read string :: Integer

calculateSum [] _ = 0
calculateSum list [] = stringToInteger list

calculateSum list (headSplit:tailSplits) = 
    (stringToInteger $ take headSplit list) +
    (calculateSum (drop headSplit list) (map (+(-headSplit)) tailSplits))

checkCalculationSum list sum split = (calculateSum list split) == sum

findCalculationPowerset _ _ [] = [-1]

findCalculationPowerset list sum (headSplit:tailSplits) =
    if (checkCalculationSum list sum headSplit) then headSplit
    else (findCalculationPowerset list sum tailSplits)

findCalculation list sum = findCalculationPowerset list sum (powerset [1..(length list - 1)])

main = do
    print $ findCalculation "888" 24