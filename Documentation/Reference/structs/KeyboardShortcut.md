**STRUCT**

# `KeyboardShortcut`

```swift
public struct KeyboardShortcut
```

A keyboard shortcut used e.g. in menus.

## Properties
### `deleteShortcut`

```swift
public static var deleteShortcut: Self
```

A shortcut often use for "Delete" actions which is the "Delete" key on Linux and ⌘⌫ on macOS.

### `character`

```swift
public var character: ShortcutCharacter
```

The character or a sequence representing a letter or symbol.

### `ctrl`

```swift
public var ctrl: Bool
```

Whether the Ctrl key is part of the shortcut.

### `shift`

```swift
public var shift: Bool
```

Whether the Shift key is part of the shortcut.

### `alt`

```swift
public var alt: Bool
```

Whether the Alt key is part of the shortcut.

### `macModifiers`

```swift
var macModifiers: NSEvent.ModifierFlags
```

The modifiers for the macOS shortcut.

### `linuxShortcut`

```swift
var linuxShortcut: String
```

The shortcut in a representation for Linux.

## Methods
### `init(_:ctrl:shift:alt:)`

```swift
public init(_ character: Character, ctrl: Bool = true, shift: Bool = false, alt: Bool = false)
```

Initialize a keyboard shortcut.
- Parameters:
    - character: A letter.
    - ctrl: Whether Ctrl is part of the shortcut.
    - shift: Whether Shift is part of the shortcut.
    - alt: Whether Alt is part of the shortcut.

#### Parameters

| Name | Description |
| ---- | ----------- |
| character | A letter. |
| ctrl | Whether Ctrl is part of the shortcut. |
| shift | Whether Shift is part of the shortcut. |
| alt | Whether Alt is part of the shortcut. |

### `init(symbol:ctrl:shift:alt:)`

```swift
public init(symbol: ShortcutCharacter, ctrl: Bool = true, shift: Bool = false, alt: Bool = false)
```

Initialize a keyboard shortcut.
- Parameters:
    - symbol: A character.
    - ctrl: Whether Ctrl is part of the shortcut.
    - shift: Whether Shift is part of the shortcut.
    - alt: Whether Alt is part of the shortcut.

#### Parameters

| Name | Description |
| ---- | ----------- |
| symbol | A character. |
| ctrl | Whether Ctrl is part of the shortcut. |
| shift | Whether Shift is part of the shortcut. |
| alt | Whether Alt is part of the shortcut. |