module Test.Main where

import Prelude

import Data.Either (Either(..))
import Data.String as String
import Data.String.Regex (regex)
import Data.String.Regex as Regex
import Data.String.Regex.Flags (global)
import Effect (Effect)
import Effect.Class.Console (log)
import Effect.Exception (throw)
import NanoID (NanoID(..), customNanoID, newNanoID, newNanoIDWithLength)
import NanoID.CustomAlphabet (CustomAlphabet(..), base58)
import Unsafe.Coerce (unsafeCoerce)

main :: Effect Unit
main = do
  -- Test newNanoID
  NanoID id <- newNanoID
  log $ "Generated id " <> id
  when (String.length id /= 21) (throw "NanoID length is not 21")

  -- Test newNanoIDWithLength
  NanoID shorterId <- newNanoIDWithLength 8
  log $ "Generated shorter id " <> shorterId
  when (String.length shorterId /= 8) (throw "NanoID length is not 8")

  -- Test custom alphabets
  NanoID customId <- newBase58NanoID
  log $ "Generated custom id " <> customId
  when (String.length customId /= 21) (throw "NanoID length is not 21")

  -- Test custom alphabets 
  NanoID customId2 <- customNanoID (CustomAlphabet "ban") 30
  log $ "Generated custom id " <> customId2
  let rex = regex "b|a|n" global # unsafeRight
  let repl = Regex.replace rex "" customId2
  when (String.length repl /= 0) (throw "String contains invalid characters")

  pure unit

newBase58NanoID :: Effect NanoID
newBase58NanoID = customNanoID base58 21

newCustomNanoID :: Effect NanoID
newCustomNanoID = customNanoID (CustomAlphabet "abc123") 21

unsafeRight :: forall err a. Either err a -> a
unsafeRight (Right a) = a
unsafeRight (Left _) = unsafeCoerce $ throw "Error"