**CLASS**

# `ScrollView`

```swift
public class ScrollView: Widget
```

A scrollable widget containing a child widget.

## Properties
### `view`

```swift
private var view: NSScrollView?
```

The widget for macOS.

### `child`

```swift
var child: Widget?
```

The child widget.

### `view`

The scroll view.

## Methods
### `init()`

```swift
override public init()
```

Initialize the scrollable widget.

### `setChild(_:)`

```swift
public func setChild(_ widget: Widget) -> Self
```

Set the `ScrollView`'s child.
- Parameter widget: The child.
- Returns: The scrollable widget.

#### Parameters

| Name | Description |
| ---- | ----------- |
| widget | The child. |