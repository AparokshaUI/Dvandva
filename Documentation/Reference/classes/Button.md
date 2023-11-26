**CLASS**

# `Button`

A widget executing an action when being clicked.

## Properties
### `button`

The widget for macOS.

### `button`

The widget for Linux.

### `action`

The action that gets executed when the button gets pressed.

## Methods
### `init(_:)`

Initialize a button.
- Parameter title: The label of the button.

Note that after initializing a button without an icon, you cannot add an icon.

### `init(_:title:)`

Initialize a button.
- Parameters:
    - icon: The icon of the button.
    - title: The label of the button, or nil.

Note that after initializing a button with an icon, you cannot get rid of it.

### `initializeButton()`

Initialize the button on macOS.

### `setLabel(_:)`

Set the button's label.
- Parameter title: The button's label.
- Returns: The button.

Note that this only has an effect when the button has been initialized without an icon.

### `setLabel(_:title:)`

Set the button's label and icon.
- Parameters:
    - icon: The button's icon.
    - title: The button's label, or nil.

Note that this only has an effect when the button has been initialized with an icon.

### `buttonStyle(_:)`

Set the button's style.
- Parameter style: The button's style.
- Returns: The button.

### `setAction(_:)`

Set the action that gets called when the button gets pressed.
- Parameter action: The action.
- Returns: The button.

### `disabled(_:)`

Disable a button so that it cannot be clicked.
- Parameter disabled: Whether the button is disabled.
- Returns: The button.

### `buttonPressed(_:)`

This function gets called when a button is pressed under macOS.
- Parameter sender: The sender or nil.
