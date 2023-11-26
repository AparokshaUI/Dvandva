**STRUCT**

# `KeyboardShortcut`

A keyboard shortcut used e.g. in menus.

## Properties
### `deleteShortcut`

A shortcut often use for "Delete" actions which is the "Delete" key on Linux and ⌘⌫ on macOS.

### `character`

The character or a sequence representing a letter or symbol.

### `ctrl`

Whether the Ctrl key is part of the shortcut.

### `shift`

Whether the Shift key is part of the shortcut.

### `alt`

Whether the Alt key is part of the shortcut.

### `macModifiers`

The modifiers for the macOS shortcut.

### `linuxShortcut`

The shortcut in a representation for Linux.

## Methods
### `init(_:ctrl:shift:alt:)`

Initialize a keyboard shortcut.
- Parameters:
    - character: A letter.
    - ctrl: Whether Ctrl is part of the shortcut.
    - shift: Whether Shift is part of the shortcut.
    - alt: Whether Alt is part of the shortcut.

### `init(symbol:ctrl:shift:alt:)`

Initialize a keyboard shortcut.
- Parameters:
    - symbol: A character.
    - ctrl: Whether Ctrl is part of the shortcut.
    - shift: Whether Shift is part of the shortcut.
    - alt: Whether Alt is part of the shortcut.
