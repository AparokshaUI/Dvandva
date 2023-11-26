**CLASS**

# `MenuButton`

A button that opens a menu when being pressed.

## Properties
### `button`

The widget for macOS.

### `button`

The widget for Linux.

### `menu`

The content.

## Methods
### `init(_:)`

Initialize a menu button.
- Parameter title: The label of the button.

Note that after initializing a button without an icon, you cannot add an icon.

### `init(_:title:)`

Initialize a menu button.
- Parameters:
    - icon: The icon of the button.
    - title: The label of the button, or nil.

Note that after initializing a button with an icon, you cannot get rid of it.

### `initButton()`

Initialize the button.

### `setLabel(_:)`

Set the menu button's label.
- Parameter title: The button's label.
- Returns: The button.

Note that this only has an effect when the button has been initialized without an icon.

### `setLabel(_:title:)`

Set the menu button's label and icon.
- Parameters:
    - icon: The button's icon.
    - title: The button's label, or nil.

Note that this only has an effect when the button has been initialized with an icon.

### `buttonStyle(_:)`

Set the button's style.
- Parameter style: The button's style.
- Returns: The button.

### `editMenu(_:)`

Edit the menu of the menu button.
- Parameter menu: The closure for editing the menu.
- Returns: The menu button.
