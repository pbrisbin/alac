{-# LANGUAGE OverloadedStrings #-}
module Alac.PackageIndexSpec
    ( spec
    , main
    ) where

import Test.Hspec
import Alac.Package
import Alac.PackageIndex

import qualified Data.Text.IO as T

main :: IO ()
main = hspec spec

spec :: Spec
spec = describe "parsePackages" $
    it "parses packages from HTML" $ do
        content <- T.readFile "test/fixtures/erlang.html"

        let parsed = parsePackages "erlang" content
            expected =
                [ Package { packageName = "erlang", packageVersion = Version "17.0-1", packageArch = Ai686 }
                , Package { packageName = "erlang", packageVersion = Version "17.0-1", packageArch = Ax86_64 }
                , Package { packageName = "erlang", packageVersion = Version "17.1-1", packageArch = Ai686 }
                , Package { packageName = "erlang", packageVersion = Version "17.1-1", packageArch = Ax86_64 }
                , Package { packageName = "erlang", packageVersion = Version "17.1-2", packageArch = Ai686 }
                , Package { packageName = "erlang", packageVersion = Version "17.1-2", packageArch = Ax86_64 }
                , Package { packageName = "erlang", packageVersion = Version "17.3-1", packageArch = Ai686 }
                , Package { packageName = "erlang", packageVersion = Version "17.3-1", packageArch = Ax86_64 }
                , Package { packageName = "erlang", packageVersion = Version "17.3.4-1", packageArch = Ai686 }
                , Package { packageName = "erlang", packageVersion = Version "17.3.4-1", packageArch = Ax86_64 }
                , Package { packageName = "erlang", packageVersion = Version "17.4-1", packageArch = Ai686 }
                , Package { packageName = "erlang", packageVersion = Version "17.4-1", packageArch = Ax86_64 }
                , Package { packageName = "erlang", packageVersion = Version "17.5-1", packageArch = Ai686 }
                , Package { packageName = "erlang", packageVersion = Version "17.5-1", packageArch = Ax86_64 }
                , Package { packageName = "erlang", packageVersion = Version "18.0-1", packageArch = Ai686 }
                , Package { packageName = "erlang", packageVersion = Version "18.0-1", packageArch = Ax86_64 }
                , Package { packageName = "erlang", packageVersion = Version "18.0-2", packageArch = Ai686 }
                , Package { packageName = "erlang", packageVersion = Version "18.0-2", packageArch = Ax86_64 }
                , Package { packageName = "erlang", packageVersion = Version "18.1-1", packageArch = Ai686 }
                , Package { packageName = "erlang", packageVersion = Version "18.1-1", packageArch = Ax86_64 }
                , Package { packageName = "erlang", packageVersion = Version "18.1-2", packageArch = Ai686 }
                , Package { packageName = "erlang", packageVersion = Version "18.1-2", packageArch = Ax86_64 }
                , Package { packageName = "erlang", packageVersion = Version "18.2.1-1", packageArch = Ai686 }
                , Package { packageName = "erlang", packageVersion = Version "18.2.1-1", packageArch = Ax86_64 }
                , Package { packageName = "erlang", packageVersion = Version "R16B01-2", packageArch = Ai686 }
                , Package { packageName = "erlang", packageVersion = Version "R16B01-2", packageArch = Ax86_64 }
                , Package { packageName = "erlang", packageVersion = Version "R16B02-1", packageArch = Ai686 }
                , Package { packageName = "erlang", packageVersion = Version "R16B02-1", packageArch = Ax86_64 }
                , Package { packageName = "erlang", packageVersion = Version "R16B02-2", packageArch = Ai686 }
                , Package { packageName = "erlang", packageVersion = Version "R16B02-2", packageArch = Ax86_64 }
                , Package { packageName = "erlang", packageVersion = Version "R16B03-2", packageArch = Ai686 }
                , Package { packageName = "erlang", packageVersion = Version "R16B03-2", packageArch = Ax86_64 }
                , Package { packageName = "erlang", packageVersion = Version "R16B03-3", packageArch = Ai686 }
                , Package { packageName = "erlang", packageVersion = Version "R16B03-3", packageArch = Ax86_64 }
                , Package { packageName = "erlang", packageVersion = Version "R16B03-4", packageArch = Ai686 }
                , Package { packageName = "erlang", packageVersion = Version "R16B03-4", packageArch = Ax86_64 }
                , Package { packageName = "erlang", packageVersion = Version "R16B03-5", packageArch = Ai686 }
                , Package { packageName = "erlang", packageVersion = Version "R16B03-5", packageArch = Ax86_64 }
                , Package { packageName = "erlang", packageVersion = Version "R16B03_1-1", packageArch = Ai686 }
                , Package { packageName = "erlang", packageVersion = Version "R16B03_1-1", packageArch = Ax86_64 }
                ]

        parsed `shouldBe` expected
