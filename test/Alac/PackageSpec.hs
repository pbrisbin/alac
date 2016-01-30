{-# LANGUAGE OverloadedStrings #-}
module Alac.PackageSpec
    ( spec
    , main
    ) where

import Test.Hspec
import Alac.Package

main :: IO ()
main = hspec spec

spec :: Spec
spec = describe "parsePackage" $
    it "parses package strings" $ do
        let parsed = parsePackage "erlang" "erlang-R16B03-2-i686.pkg.tar.xz"
            expected = Package
                { packageName = "erlang"
                , packageVersion = Version "R16B03-2"
                , packageArch = Ai686
                }

        parsed `shouldBe` Just expected
