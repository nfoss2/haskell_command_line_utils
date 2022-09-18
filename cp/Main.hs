module Main where

import System.Environment
import Control.Exception
import System.Directory

main :: IO ()
main = do
    args <- getArgs
    if null args then do
        fileError ""
        return ()
    else if length args /= 2 then do
        putStrLn "usage: cp source_file target_file"
    else
        putFile args


putFile :: [FilePath] -> IO ()
putFile [] = return ()
putFile [x,y] = do
    validx <- doesFileExist x
    validy <- doesDirectoryExist (getDirectory y)
    if validx && validy then
        do
            if x == y then
                sameFile x
            else do
                text <- readFile x
                copyFile x y
    else do
        if validx then fileError y else
            fileError x


sameFile :: String-> IO ()
sameFile repeat = do
    putStrLn ("cp: " ++ repeat ++ " and " ++ repeat ++ " are identical (not copied).")

fileError :: String -> IO ()
fileError badFile = do
    putStr ("cp: " ++ badFile ++ ": No such file or directory\n")

getDirectory :: String -> String
getDirectory x = reverse (dropUntil (reverse x) '/')

dropUntil :: String -> Char -> String
dropUntil (x:xs) c = if x == c then x:xs else dropUntil xs '/'
