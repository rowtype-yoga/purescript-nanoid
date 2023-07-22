# purescript-nanoid

<img src="https://ai.github.io/nanoid/logo.svg" align="right"
     alt="Nano ID logo by Anton Lovchikov" width="180" height="94">

Bindings to the [nanoid](https://github.com/ai/nanoid) JavaScript package

NanoIDs are an alternative to UUIDs

## Usage

```purs
-- ...
import NanoID (NanoID(..), customNanoID, newNanoID, newNanoIDWithLength)
import NanoID.CustomAlphabet (CustomAlphabet(..), base58)

main :: Effect Unit
main = do
  -- Default length of 21, base64 (AlphaNums with `_` and `-`)
  NanoID id <- newNanoID
  Console.log id --> "UDTOUas5Z6q6aAs8JT_K_"

  -- Custom length
  NanoID shorterId <- newNanoIDWithLength 8
  Console.log shorterId --> "ey0q_xsl"

  -- Custom alphabet
  NanoID customId <- newBase58NanoID
  Console.log customId --> "9NkaHY8MFqCgt336t5b1k"

-- Custom alphabet constructor
-- There are several default alphabets defined in the module
newBase58NanoID :: Effect NanoID
newBase58NanoID = customNanoID base58 21

-- Or define your own
newCustomNanoID :: Effect NanoID
newCustomNanoID = customNanoID (CustomAlphabet "abc123") 21
```
