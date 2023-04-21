module NanoID (newNanoID, newNanoIDWithLength, NanoID, printNanoID) where

import Prelude
import Effect (Effect)
import Yoga.JSON (class WriteForeign, class ReadForeign)
import Effect.Uncurried (EffectFn1, runEffectFn1)

newtype NanoID = NanoID String

foreign import newNanoIDImpl :: EffectFn1 Int NanoID

newNanoIDWithLength :: Int -> Effect NanoID
newNanoIDWithLength = runEffectFn1 newNanoIDImpl

newNanoID :: Effect NanoID
newNanoID = newNanoIDWithLength 21

derive newtype instance Eq NanoID
derive newtype instance Ord NanoID
derive newtype instance WriteForeign NanoID
derive newtype instance ReadForeign NanoID

printNanoID :: NanoID -> String
printNanoID (NanoID s) = s