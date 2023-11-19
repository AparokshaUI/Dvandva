**CLASS**

# `Box`

```swift
public class Box: Widget
```

A widget containing multiple items either aligned horizontally or vertically.

## Properties
### `box`

```swift
private var box: NSStackView?
```

The widget for macOS.

### `box`

The widget for Linux.

### `content`

```swift
var content: [Widget] = []
```

The widgets being arranged by the box widget.

## Methods
### `init(horizontal:)`

```swift
public init(horizontal: Bool = false)
```

Initialize a box.
- Parameter horizontal: Whether the box aligns its children horizontally or vertically.

#### Parameters

| Name | Description |
| ---- | ----------- |
| horizontal | Whether the box aligns its children horizontally or vertically. |

### `append(_:)`

```swift
public func append(_ widget: Widget) -> Self
```

Add a widget to the trailing or bottom of the box.
- Parameter widget: The widget.
- Returns: The box.

#### Parameters

| Name | Description |
| ---- | ----------- |
| widget | The widget. |

### `prepend(_:)`

```swift
public func prepend(_ widget: Widget) -> Self
```

Add a widget to the leading or top of the box.
- Parameter widget: The widget.
- Returns: The box.

#### Parameters

| Name | Description |
| ---- | ----------- |
| widget | The widget. |

### `removeWidget(_:)`

```swift
public func removeWidget(_ widget: Widget)
```

Remove a certain widget from the view.
- Parameter widget: The widget.

#### Parameters

| Name | Description |
| ---- | ----------- |
| widget | The widget. |