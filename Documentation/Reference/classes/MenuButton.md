**CLASS**

# `MenuButton`

```swift
public class MenuButton: Widget
```

A button that opens a menu when being pressed.

## Properties
### `button`

```swift
let button: Button
```

The widget for macOS.

### `button`

The widget for Linux.

### `menu`

```swift
let menu: Menu = .init()
```

The content.

## Methods
### `init(_:)`

```swift
public init(_ title: String)
```

Initialize a menu button.
- Parameter title: The label of the button.

Note that after initializing a button without an icon, you cannot add an icon.

#### Parameters

| Name | Description |
| ---- | ----------- |
| title | The label of the button. |

### `init(_:title:)`

```swift
public init(_ icon: Icon, title: String? = nil)
```

Initialize a menu button.
- Parameters:
    - icon: The icon of the button.
    - title: The label of the button, or nil.

Note that after initializing a button with an icon, you cannot get rid of it.

#### Parameters

| Name | Description |
| ---- | ----------- |
| icon | The icon of the button. |
| title | The label of the button, or nil. |

### `initButton()`

```swift
func initButton()
```

Initialize the button.

### `setLabel(_:)`

```swift
public func setLabel(_ title: String) -> Self
```

Set the menu button's label.
- Parameter title: The button's label.
- Returns: The button.

Note that this only has an effect when the button has been initialized without an icon.

#### Parameters

| Name | Description |
| ---- | ----------- |
| title | The button’s label. |

### `setLabel(_:title:)`

```swift
public func setLabel(_ icon: Icon, title: String? = nil) -> Self
```

Set the menu button's label and icon.
- Parameters:
    - icon: The button's icon.
    - title: The button's label, or nil.

Note that this only has an effect when the button has been initialized with an icon.

#### Parameters

| Name | Description |
| ---- | ----------- |
| icon | The button’s icon. |
| title | The button’s label, or nil. |

### `buttonStyle(_:)`

```swift
public func buttonStyle(_ style: ButtonStyle) -> Self
```

Set the button's style.
- Parameter style: The button's style.
- Returns: The button.

#### Parameters

| Name | Description |
| ---- | ----------- |
| style | The button’s style. |

### `editMenu(_:)`

```swift
public func editMenu(_ menu: (Menu) -> Void) -> Self
```

Edit the menu of the menu button.
- Parameter menu: The closure for editing the menu.
- Returns: The menu button.

#### Parameters

| Name | Description |
| ---- | ----------- |
| menu | The closure for editing the menu. |