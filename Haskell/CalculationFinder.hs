import System.Environment
import System.Exit

powerset [] = [[]]
powerset (head:tail) = subset ++ map (head:) subset
                 where subset = powerset tail

stringToInteger string = read string :: Integer

calculateSum [] _ = 0
calculateSum list [] = stringToInteger list

calculateSum list (headSplit:tailSplits) = 
    (stringToInteger (take headSplit list)) +
    (calculateSum (drop headSplit list) (map (+(-headSplit)) tailSplits))

checkCalculationSum list sum split = (calculateSum list split) == stringToInteger sum

findCalculationPowerset _ _ [] = [-1]

findCalculationPowerset list sum (headSplit:tailSplits) =
    if (checkCalculationSum list sum headSplit) then headSplit
    else (findCalculationPowerset list sum tailSplits)

findCalculation list sum = findCalculationPowerset list sum (powerset [1..(length list - 1)])

showCalculationResult (headSplit:tailSplits) calculation =
    take headSplit calculation ++ "+"

main = do
    args <- getArgs
    --print (findCalculation (head args) (last args))
    print $ showCalculationResult (findCalculation (head args) (last args))  (head args)
    exitWith ExitSuccess