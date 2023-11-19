**CLASS**

# `Menu`

```swift
public class Menu
```

A menu is a collection of buttons, organized in sections and submenus.

## Properties
### `menu`

```swift
private let menu: NSMenu = .init()
```

The menu for macOS.

### `content`

```swift
var content: [(NSMenuItem, Menu?)] = []
```

The menu's content for macOS.

### `menu`

The menu for Linux.

### `content`

The menu's content for Linux.

## Methods
### `init()`

```swift
public init()
```

Initialize a menu.

### `addButton(_:app:shortcut:handler:)`

```swift
public func addButton(
    _ label: String,
    app: Application,
    shortcut: KeyboardShortcut? = nil,
    handler: @escaping () -> Void
) -> Self
```

Add a button to a menu.
- Parameters:
  - label: The button's label.
  - app: The application.
  - shortcut: The button's keyboard shortcut.
  - handler: Handle the action when the button is clicked or the shortcut is pressed.
- Returns: The menu.

#### Parameters

| Name | Description |
| ---- | ----------- |
| label | The button’s label. |
| app | The application. |
| shortcut | The button’s keyboard shortcut. |
| handler | Handle the action when the button is clicked or the shortcut is pressed. |

### `addButton(_:app:id:)`

```swift
public func addButton(_ label: String, app: Application, id: String) -> Self
```

Add a button to a menu that runs an action specified in the menu bar or the app's actions.
- Parameters:
  - label: The button's label.
  - app: The application.
  - id: The label of the button that holds the original action.
- Returns: The menu.

#### Parameters

| Name | Description |
| ---- | ----------- |
| label | The button’s label. |
| app | The application. |
| id | The label of the button that holds the original action. |

### `addSection(_:)`

```swift
public func addSection(_ menu: Menu) -> Self
```

Add a section to a menu.
- Parameter menu: The menu in the section.
- Returns: The menu.

#### Parameters

| Name | Description |
| ---- | ----------- |
| menu | The menu in the section. |

### `addSubmenu(_:_:)`

```swift
public func addSubmenu(_ label: String, _ menu: Menu) -> Self
```

Add another menu inside this menu.
- Parameters:
  - label: The child menu's title.
  - menu: The child menu.
- Returns: The parent menu.

#### Parameters

| Name | Description |
| ---- | ----------- |
| label | The child menu’s title. |
| menu | The child menu. |

### `getMenu()`

```swift
func getMenu() -> NSMenu
```

Get the `NSMenu`.
- Returns: The `NSMenu`.

### `getMenu()`

Get the `GTUI.Menu`.
- Returns: The `GTUI.Menu`.
