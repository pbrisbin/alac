module Main where

import Alac.API (waiApp)
import Network.Wai.Handler.Warp (runEnv)

main :: IO ()
main = runEnv 3000 =<< waiApp
