import System.Environment
import System.Exit

powset [] = [[]]
powset (head:tail) = subset ++ [head:s | s <- subset]
                 where subset = powset tail

stringToInteger string = read string :: Integer

calculateSum [] _ = 0
calculateSum list [] = stringToInteger list
calculateSum list (headSplit:tailSplits) = 
    (stringToInteger (take headSplit list)) +
    (calculateSum (drop headSplit list) (map (+(-headSplit)) tailSplits))

checkCalculationSum list sum split = (calculateSum list split) == stringToInteger sum

findCalculationPowset _ _ [] = []
findCalculationPowset list sum splits = [x | x <- splits, checkCalculationSum list sum x]

findCalculation list sum = findCalculationPowset list sum (powset [1..(length list - 1)])

showCalculationResult [] calculation = calculation
showCalculationResult (headSplit:tailSplits) calculation =
    take headSplit calculation ++ "+" ++ (showCalculationResult (map (+(-headSplit)) tailSplits) (drop headSplit calculation))
    
showCalculation splits sum = [s | x <- splits, s <- showCalculationResult x sum ++ "\n"]

main = do
    args <- getArgs
    putStrLn $ showCalculation (findCalculation (head args) (last args))  (head args)
    exitWith ExitSuccess