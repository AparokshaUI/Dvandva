**CLASS**

# `NativeWrapper`

A wrapper around native widgets.

On macOS, it accepts an NSView,
and on Linux, you can use Libadwaita
(https://github.com/AparokshaUI/Libadwaita).

## Methods
### `init(_:)`

Initialize a native wrapper for macOS.
- Parameter nativeView: The NSView.

### `init(_:)`

Initialize a native wrapper for Linux.
- Parameter nativeView: The class conforming to `Libadwaita.NativeWidgetPeer`.
