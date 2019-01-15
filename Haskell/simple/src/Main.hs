module Main where

import System.IO (hFlush, stdout)
import Control.Exception (catch, IOException)
import Control.Monad (replicateM_)

prompt :: String -> IO a -> IO a
prompt x getter = do
    putStr x
    hFlush stdout
    line <- getter
    return line

run :: IO ()
run = do
    message <- prompt "Enter message: " getLine
    n <- prompt "Enter N: " readLn
    replicateM_ n (putStrLn message)

main :: IO ()
main =
    catch run handler
    where
        handler :: IOException -> IO ()
        handler ex = do
            let msg = "An error occurred:" <> show ex
            putStrLn msg
