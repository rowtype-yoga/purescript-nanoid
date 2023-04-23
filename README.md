# purescript-nanoid
Bindings to the nanoid JavaScript package

## Usage

main = do
  NanoID id <- newNanoID
  Console.log id
  NanoID shorterId <- newNanoIDWithLength 8
  Console.log shorterId
