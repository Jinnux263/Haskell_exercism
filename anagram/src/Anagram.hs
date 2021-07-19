module Anagram (anagramsFor) where
import Data.Char

isSameLength :: String -> String -> Bool
isSameLength [] [] = True
isSameLength a [] = False
isSameLength [] a = False
isSameLength (a:as) (b:bs) = isSameLength as bs

quickSort :: (Ord a, Eq a) => [a] -> [a]
quickSort [] = []
quickSort (x:xs) = first ++ [x] ++ second
    where
        first = quickSort [a | a <- xs, a < x]
        second = quickSort [a | a <- xs, a >= x]

isAnagram :: String -> String -> [String]
isAnagram xs xss = 
    let
        checkStr = map toLower xs
        testStr = map toLower xss
    
    in 
        if (not (checkStr == testStr)) && (isSameLength checkStr testStr)
        then 
            if (quickSort checkStr) == (quickSort testStr)
            then 
                [xss]
            else
                []
        else
            []

anagramsFor :: String -> [String] -> [String]
anagramsFor _ [] = []
anagramsFor checkStr (x:xs) = (isAnagram checkStr x) ++ (anagramsFor checkStr xs)

        
    
