module NanoID (newNanoID, newNanoIDWithLength, customNanoID, NanoID(..), printNanoID) where

import Prelude

import Data.Newtype (class Newtype, unwrap)
import Effect (Effect)
import NanoID.CustomAlphabet (CustomAlphabet)
import Yoga.JSON (class WriteForeign, class ReadForeign)

newtype NanoID = NanoID String

foreign import newNanoIDImpl :: Int -> Effect NanoID
foreign import newCustomNanoIDImpl :: String -> Int -> Effect NanoID

newNanoIDWithLength :: Int -> Effect NanoID
newNanoIDWithLength = newNanoIDImpl

newNanoID :: Effect NanoID
newNanoID = newNanoIDWithLength 21

customNanoID :: CustomAlphabet -> Int -> Effect NanoID
customNanoID = newCustomNanoIDImpl <<< unwrap

derive newtype instance Eq NanoID
derive newtype instance Ord NanoID
derive newtype instance WriteForeign NanoID
derive newtype instance ReadForeign NanoID
derive newtype instance Show NanoID
derive instance Newtype NanoID _

printNanoID :: NanoID -> String
printNanoID = unwrap
