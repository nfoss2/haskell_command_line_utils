module Main (main) where


import System.Environment
import System.Directory
import Data.List

main :: IO ()
main = do
    args <- getArgs
    if null args then do
        return ()
    else putFile args

putFile :: [FilePath] -> IO ()
putFile [] = return ()
putFile (x:xs) = do 
    if length (x:xs) == 1 then putOne x
    else if length (x:xs) == 2 then putTwo (x:xs)
        else do
            putFirst (x:xs)

putMult :: [FilePath] -> IO ()
putMult [] = return ()
putMult [x] = do
    vaild <- doesFileExist x
    if vaild then
        do
            text <- readFile x
            printTitle x
            putStr (unlines (take 10 (lines text)))
    else do
        fileError x
putMult (x:xs) = do
    vaild <- doesFileExist x
    if vaild then
        do
            text <- readFile x
            printTitle x
            putStr (unlines (take 10 (lines text)))
    else do
        fileError x
    putMult xs

putFirst :: [FilePath] -> IO ()
putFirst (x:xs) = do
    vaild <- doesFileExist x
    if vaild then
        do
            text <- readFile x
            printFirstTitle x
            putStr (unlines (take 10 (lines text)))
    else do
        fileError x
    putMult xs

putTwo :: [FilePath] -> IO ()
putTwo (x:xs) = do --put first then decide what to do from there
    vaild <- doesFileExist x
    if vaild then
        do
            text <- readFile x
            printFirstTitle x
            putStr (unlines (take 10 (lines text)))
            putMult xs
    else do
        fileError x
        putFirst xs

putOne :: FilePath -> IO ()
putOne x = do
   vaild <- doesFileExist x
   if vaild then
      do
         text <- readFile x
         putStr (unlines (take 10 (lines text)))
   else do
      fileError x

fileError :: String -> IO ()
fileError badFile = do
   putStr ("head: " ++ badFile ++ ": No such file or directory\n")

printFirstTitle :: String -> IO ()
printFirstTitle file = putStrLn ("==> " ++ file ++ " <==") 

printTitle :: String -> IO ()
printTitle file = putStrLn ("\n==> " ++ file ++ " <==") 
