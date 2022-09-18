module Main where

import System.Environment
import Control.Exception
import System.Directory
import Data.List
import Data.String

main :: IO ()
main = do
    args <- getArgs
    if null args then do
        fileError
    else do
        bools <- mapM doesFileExist args
        if and bools then
            putFile args
        else
            fileError


putFile :: [FilePath] -> IO ()
putFile [] = return ()
putFile files = do
    allText <- mapM readFile files
    putStr (unlines (sort (lines (concat allText))))


fileError ::  IO ()
fileError = do
    putStr "sort: No such file or directory\n"
    return ()


