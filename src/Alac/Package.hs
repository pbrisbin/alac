module Alac.Package where

import Data.Text (Text)

import Text.Parsec
import Text.Parsec.Text

import qualified Data.Text as T

newtype Version = Version Text deriving Eq

instance Show Version where
    show (Version v) = T.unpack v

data Arch = Ai686 | Ax86_64 deriving Eq

instance Show Arch where
    show Ai686 = "i686"
    show Ax86_64 = "x86_64"

data Package = Package
    { packageName :: Text
    , packageVersion :: Version
    , packageArch :: Arch
    }
    deriving Eq

instance Show Package where
    show (Package n v a) = mconcat
        [ T.unpack n
        , "-", show v
        , "-", show a
        , ".pkg.tar.xz"
        ]

parsePackage :: Text -> Text -> Maybe Package
parsePackage name str =
    case parse (parsePackage_ name) "<input>" str of
        Right x -> Just x
        Left _e -> Nothing

parsePackage_ :: Text -> Parser Package
parsePackage_ name = do
    _ <- string $ T.unpack name
    _ <- char '-'
    v <- manyTill anyToken $ lookAhead $ try parseArch
    a <- parseArch
    _ <- string ".pkg.tar.xz"
    eof

    return Package
        { packageName = name
        , packageVersion = Version $ T.pack v
        , packageArch = a
        }

  where
    -- N.B. this eats the leading hyphen for convenience
    parseArch = char '-' >> choice
        [ string "i686" >> return Ai686
        , string "x86_64" >> return Ax86_64
        ]
