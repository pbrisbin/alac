{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE ViewPatterns #-}
module Alac.API where

import Data.Text (Text)
import Data.Monoid ((<>))
import Yesod.Core

import Alac.Package
import Alac.PackageIndex

import qualified Data.Text as T

data App = App

mkYesod "App" [parseRoutes| /#String Root GET |]

instance Yesod App

getRoot :: String -> Handler Text
getRoot name = do
    pkgs <- liftIO $ listPackages name

    return $ T.unlines $ map (T.pack . toEntry) pkgs

  where
    toEntry pkg = archive <> path name <> show pkg

waiApp :: IO Application
waiApp = toWaiApp App
