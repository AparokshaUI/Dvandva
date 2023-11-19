**CLASS**

# `NativeWrapper`

```swift
public class NativeWrapper: Widget
```

A wrapper around native widgets.

On macOS, it accepts an NSView,
and on Linux, you can use SwiftGui
(https://github.com/david-swift/SwiftGui).

## Methods
### `init(_:)`

```swift
public init(_ nativeView: NSView)
```

Initialize a native wrapper for macOS.
- Parameter nativeView: The NSView.

#### Parameters

| Name | Description |
| ---- | ----------- |
| nativeView | The NSView. |

### `init(_:)`

Initialize a native wrapper for Linux.
- Parameter nativeView: The class conforming to `GTUI.NativeWidgetPeer`.
