module NanoID.CustomAlphabet where

import Prelude

import Data.Newtype (class Newtype)

newtype CustomAlphabet = CustomAlphabet String

lower :: CustomAlphabet
lower = CustomAlphabet "abcdefghijklmnopqrstuvwxyz"

digits :: CustomAlphabet
digits = CustomAlphabet "0123456789"

upper :: CustomAlphabet
upper = CustomAlphabet "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

base36 :: CustomAlphabet
base36 = digits <> lower

base58 :: CustomAlphabet
base58 = CustomAlphabet "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"

alphanum :: CustomAlphabet
alphanum = digits <> lower <> upper

derive instance Newtype CustomAlphabet _

derive newtype instance Semigroup CustomAlphabet
derive newtype instance Show CustomAlphabet
