**CLASS**

# `Menu`

A menu is a collection of buttons, organized in sections and submenus.

## Properties
### `menu`

The menu for macOS.

### `content`

The menu's content for macOS.

### `menu`

The menu for Linux.

### `content`

The menu's content for Linux.

## Methods
### `init()`

Initialize a menu.

### `addButton(_:app:shortcut:handler:)`

Add a button to a menu.
- Parameters:
  - label: The button's label.
  - app: The application.
  - shortcut: The button's keyboard shortcut.
  - handler: Handle the action when the button is clicked or the shortcut is pressed.
- Returns: The menu.

### `addButton(_:app:id:)`

Add a button to a menu that runs an action specified in the menu bar or the app's actions.
- Parameters:
  - label: The button's label.
  - app: The application.
  - id: The label of the button that holds the original action.
- Returns: The menu.

### `addSection(_:)`

Add a section to a menu.
- Parameter menu: The menu in the section.
- Returns: The menu.

### `addSubmenu(_:_:)`

Add another menu inside this menu.
- Parameters:
  - label: The child menu's title.
  - menu: The child menu.
- Returns: The parent menu.

### `getMenu()`

Get the `NSMenu`.
- Returns: The `NSMenu`.

### `getMenu()`

Get the `Libadwaita.Menu`.
- Returns: The `Libadwaita.Menu`.
