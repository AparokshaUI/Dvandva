**CLASS**

# `Box`

A widget containing multiple items either aligned horizontally or vertically.

## Properties
### `box`

The widget for macOS.

### `box`

The widget for Linux.

### `content`

The widgets being arranged by the box widget.

## Methods
### `init(horizontal:)`

Initialize a box.
- Parameter horizontal: Whether the box aligns its children horizontally or vertically.

### `append(_:)`

Add a widget to the trailing or bottom of the box.
- Parameter widget: The widget.
- Returns: The box.

### `prepend(_:)`

Add a widget to the leading or top of the box.
- Parameter widget: The widget.
- Returns: The box.

### `removeWidget(_:)`

Remove a certain widget from the view.
- Parameter widget: The widget.
