module Main where

import System.Environment
import System.Directory
import Data.List
-- import qualified Data.ByteString.Char8
-- import qualified Network.DNS.Lookup

main :: IO ()
main = do
    args <- getArgs
    if null args then do
        putStr "usage: curl url [urls]\n"
        return ()
    else do
        --getResult args
        return ()

-- getResult :: [FilePath] -> IO ()
-- getResult [url] = do
--     let hostname = Data.ByteString.Char8.pack "www.example.com"
--     rs <- makeResolvSeed defaultResolvConf
--     withResolver rs $ \resolver -> lookupA resolver hostname