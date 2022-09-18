module Main (main) where

import System.Environment
import System.Directory
import Data.List

main :: IO ()
main = do
   args <- getArgs
   if null args then do
      fileError ""
      return ()
   else putFile args

putFile :: [FilePath] -> IO ()
putFile [] = return ()
putFile (x:xs) = do
   vaild <- doesFileExist x
   if vaild then
      do
         text <- readFile x
         putStr (unlines (map reverse (lines text)))
   else do
      fileError x
   putFile xs

fileError :: String -> IO ()
fileError badFile = do
   putStr ("rev: " ++ badFile ++ ": No such file or directory\n")

