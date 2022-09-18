module Main (main) where

import System.Environment

main :: IO ()
main = do
    args <- getArgs
    printArgs args

printArgs :: [String] -> IO ()
printArgs [] = putStrLn ""
printArgs [x] = putStrLn x
printArgs (x:xs) = do 
    putStr (x ++ " ")
    printArgs xs
