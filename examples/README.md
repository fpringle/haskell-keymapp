# Examples of using the `keymapp` library

See the [cabal file](https://github.com/fpringle/haskell-keymapp/blob/main/examples/keymapp-examples.cabal) for a list of examples (`executable` stanzas).

To try an example, run `cabal run <example>` e.g. `cabal run keymapp-rainbow`.

## Rainbow

Flashes a rainbow across the keyboard, then back to normal.

```bash
cabal run keymap-rainbow
```

## Clock

Displays an (imperfect) clock using the keyboard's LEDs, updating once per minute.

```bash
cabal run keymap-clock
```
