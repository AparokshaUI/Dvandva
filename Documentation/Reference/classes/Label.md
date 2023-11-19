**CLASS**

# `Label`

```swift
public class Label: Widget
```

A widget showing a piece of text.

## Properties
### `label`

```swift
private var label: NSTextField?
```

The widget for macOS.

### `content`

```swift
var content: [(NSMenuItem, Menu?)] = []
```

The content in macOS.

### `label`

The widget for Linux.

## Methods
### `init()`

```swift
override public init()
```

Initialize a label.

### `setText(_:)`

```swift
public func setText(_ text: String) -> Self
```

Set the label's text.
- Parameter text: The new text.
- Returns: The label.

#### Parameters

| Name | Description |
| ---- | ----------- |
| text | The new text. |

### `setFont(_:)`

```swift
public func setFont(_ font: Font) -> Self
```

Set the label's font.
- Parameter font: The label's font.
- Returns: The label.

#### Parameters

| Name | Description |
| ---- | ----------- |
| font | The label’s font. |