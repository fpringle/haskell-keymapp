# Keymapp client library and CLI

This library provides a client for interacting with the [Keymapp](https://blog.zsa.io/keymapp) API to control a ZSA keyboard. It can be used as a Haskell library, or via the provided CLI executable, which is inspired by [Kontroll](https://github.com/zsa/kontroll).

For example library use, see the [examples](https://github.com/fpringle/haskell-keymapp/tree/main/examples) directory.

## Building and running the CLI

In the root directory, run `nix-shell` (or use [direnv](https://direnv.net/)) to load a development shell with `ghc`, `cabal etc`. Then just run the following to see a list of available commands:

```bash
$ cabal run keymapp --
...
$ cabal run keymapp -- status
version:   1.3.7
keyboard:
  name:    Moonlander MK1
  version: Mvvpr/orAw9d
  layer:   1
```

## LED mapping

Some of the commands require you to provide an LED index. See [this](https://github.com/fpringle/haskell-keymapp/blob/main/keymapp/led_mapping.md) table for a mapping of which keyboard keys correspond to which indices on a ZSA Moonlander MK1.
