**ENUM**

# `KeyboardShortcut.ShortcutCharacter`

```swift
public enum ShortcutCharacter
```

The special characters available for shortcuts.

## Cases
### `backspace`

```swift
case backspace
```

The ⌫ character.

### `delete`

```swift
case delete
```

The ⌦ character.

### `tab`

```swift
case tab
```

The ⇥ character.

### `enter`

```swift
case enter
```

The ⏎ character.

### `escape`

```swift
case escape
```

The ⎋ character.

### `space`

```swift
case space
```

The ␣ character.

### `up`

```swift
case up
```

An arrow key.

### `character(_:)`

```swift
case character(_ character: Character)
```

A custom character.

## Properties
### `macOSRepresentation`

```swift
var macOSRepresentation: String
```

A representation of the keys for macOS.

### `linuxRepresentation`

```swift
var linuxRepresentation: String
```

A representation of the keys for Linux.
