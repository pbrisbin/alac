{-# LANGUAGE OverloadedStrings #-}
module Alac.PackageIndex
    ( listPackages
    , parsePackages
    , path
    , archive
    ) where

import Control.Monad ((<=<))
import Data.Maybe (mapMaybe)
import Data.Monoid ((<>))
import Data.Text (Text)
import Data.Text.Lazy (toStrict)
import Data.Text.Lazy.Encoding (decodeUtf8)
import Network.HTTP.Conduit (simpleHttp)
import Text.HTML.TagSoup (Tag(..), parseTags)

import Alac.Package

import qualified Data.Text as T

listPackages :: String -> IO [Package]
listPackages name = do
    let url = archive <> path name

    html <- bsToText <$> simpleHttp url

    return $ parsePackages (T.pack name) html
  where
    bsToText = toStrict . decodeUtf8

parsePackages :: Text -> Text -> [Package]
parsePackages name = mapMaybe (parsePackage name <=< toHref) . parseTags
  where
    toHref :: Tag Text -> Maybe Text
    toHref (TagOpen "a" attrs) = lookup "href" attrs
    toHref _ = Nothing

path :: String -> String
path name = take 1 name <> "/" <> name <> "/"

archive :: String
archive = "https://archive.archlinux.org/packages/"
