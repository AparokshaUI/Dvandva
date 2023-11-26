**CLASS**

# `List`

A widget containing multiple items arranged in a list.

## Properties
### `controller`

The list controller.

### `list`

The widget for Linux.

## Methods
### `init()`

Initialize a list.

### `append(_:)`

Add a widget to the bottom of the list.
- Parameter widget: The widget.
- Returns: The list.

### `append(label:icon:)`

Add a standard widget to the bottom of the list.
- Parameters:
  - label: The widget's label.
  - icon: The widget's icon.
- Returns: The list.

A standard widget is a widget consisting of a label, and, on macOS, optionally an icon.

### `prepend(_:)`

Add a widget to the top of the list.
- Parameter widget: The widget.
- Returns: The list.

### `prepend(label:icon:)`

Add a standard widget to the top of the list.
- Parameters:
  - label: The widget's label.
  - icon: The widget's icon.
- Returns: The list.

A standard widget is a widget consisting of a label, and, on macOS, optionally an icon.

### `remove(at:)`

Remove the widget at a certain index.
- Parameter index: The index.
- Returns: The list.

### `select(index:)`

Select the widget at a certain index.
- Parameter index: The index.

### `observeSelection(observer:)`

Add a closure that gets called when the selection changes.
- Parameter observer: The function taking the selection index as a parameter.

### `label(_:icon:)`

Get a standard widget consisting of a label and optionally an icon.
- Parameters:
  - label: The label.
  - icon: The icon.
- Returns: The widget.
