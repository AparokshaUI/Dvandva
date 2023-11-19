**CLASS**

# `PaddingWrapper`

```swift
public class PaddingWrapper: Widget
```

A wrapper around a widget adding padding.

## Properties
### `content`

```swift
private var content: Widget
```

The content widget.

## Methods
### `init(_:)`

```swift
public init(_ content: Widget)
```

Initialize a padding wrapper around a widget.
- Parameter content: The widget.

#### Parameters

| Name | Description |
| ---- | ----------- |
| content | The widget. |

### `setPadding(_:edges:)`

```swift
public func setPadding(_ padding: Int, edges: Set<Edge> = .all) -> Self
```

Customize the padding's size and the affected edges.
- Parameters:
    - padding: The padding's size.
    - edges: The edges being affected by the padding wrapper.

#### Parameters

| Name | Description |
| ---- | ----------- |
| padding | The padding’s size. |
| edges | The edges being affected by the padding wrapper. |