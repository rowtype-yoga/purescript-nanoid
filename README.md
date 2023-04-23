# purescript-nanoid
Bindings to the [nanoid](https://github.com/ai/nanoid) JavaScript package

NanoIDs are an alternative to UUIDs

## Usage

```purescript
main = do
  NanoID id <- newNanoID
  Console.log id
  NanoID shorterId <- newNanoIDWithLength 8
  Console.log shorterId
```
