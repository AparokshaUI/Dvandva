**CLASS**

# `List`

```swift
public class List: Widget
```

A widget containing multiple items arranged in a list.

## Properties
### `controller`

```swift
private let controller = ViewController()
```

The list controller.

### `list`

The widget for Linux.

## Methods
### `init()`

```swift
override public init()
```

Initialize a list.

### `append(_:)`

```swift
public func append(_ widget: Widget) -> Self
```

Add a widget to the bottom of the list.
- Parameter widget: The widget.
- Returns: The list.

#### Parameters

| Name | Description |
| ---- | ----------- |
| widget | The widget. |

### `append(label:icon:)`

```swift
public func append(label: String, icon: Icon?) -> Self
```

Add a standard widget to the bottom of the list.
- Parameters:
  - label: The widget's label.
  - icon: The widget's icon.
- Returns: The list.

A standard widget is a widget consisting of a label, and, on macOS, optionally an icon.

#### Parameters

| Name | Description |
| ---- | ----------- |
| label | The widget’s label. |
| icon | The widget’s icon. |

### `prepend(_:)`

```swift
public func prepend(_ widget: Widget) -> Self
```

Add a widget to the top of the list.
- Parameter widget: The widget.
- Returns: The list.

#### Parameters

| Name | Description |
| ---- | ----------- |
| widget | The widget. |

### `prepend(label:icon:)`

```swift
public func prepend(label: String, icon: Icon?) -> Self
```

Add a standard widget to the top of the list.
- Parameters:
  - label: The widget's label.
  - icon: The widget's icon.
- Returns: The list.

A standard widget is a widget consisting of a label, and, on macOS, optionally an icon.

#### Parameters

| Name | Description |
| ---- | ----------- |
| label | The widget’s label. |
| icon | The widget’s icon. |

### `remove(at:)`

```swift
public func remove(at index: Int) -> Self
```

Remove the widget at a certain index.
- Parameter index: The index.
- Returns: The list.

#### Parameters

| Name | Description |
| ---- | ----------- |
| index | The index. |

### `select(index:)`

```swift
public func select(index: Int)
```

Select the widget at a certain index.
- Parameter index: The index.

#### Parameters

| Name | Description |
| ---- | ----------- |
| index | The index. |

### `observeSelection(observer:)`

```swift
public func observeSelection(observer: @escaping (Int) -> Void)
```

Add a closure that gets called when the selection changes.
- Parameter observer: The function taking the selection index as a parameter.

#### Parameters

| Name | Description |
| ---- | ----------- |
| observer | The function taking the selection index as a parameter. |

### `label(_:icon:)`

```swift
func label(_ label: String, icon: Icon?) -> Widget
```

Get a standard widget consisting of a label and optionally an icon.
- Parameters:
  - label: The label.
  - icon: The icon.
- Returns: The widget.

#### Parameters

| Name | Description |
| ---- | ----------- |
| label | The label. |
| icon | The icon. |