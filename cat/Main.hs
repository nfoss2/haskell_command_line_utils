module Main (main) where

import System.Environment
import Control.Exception
import System.Directory

main :: IO ()
main = do
   args <- getArgs
   if null args then do
      putStr ("cat: " ++ "" ++ ": No such file or directory\n")
      return ()
   else putFile args


putFile :: [FilePath] -> IO ()
putFile [] = return ()
putFile (x:xs) = do
   vaild <- doesFileExist x
   if vaild then
      do
         text <- readFile x
         putStr text
   else do
      fileError x
   putFile xs

fileError :: String -> IO ()
fileError badFile = do
   putStr ("cat: " ++ badFile ++ ": No such file or directory\n")