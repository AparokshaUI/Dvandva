**CLASS**

# `Button`

```swift
public class Button: Widget
```

A widget executing an action when being clicked.

## Properties
### `button`

```swift
private var button: NSButton?
```

The widget for macOS.

### `button`

The widget for Linux.

### `action`

```swift
var action: () -> Void = { }
```

The action that gets executed when the button gets pressed.

## Methods
### `init(_:)`

```swift
public init(_ title: String)
```

Initialize a button.
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

Initialize a button.
- Parameters:
    - icon: The icon of the button.
    - title: The label of the button, or nil.

Note that after initializing a button with an icon, you cannot get rid of it.

#### Parameters

| Name | Description |
| ---- | ----------- |
| icon | The icon of the button. |
| title | The label of the button, or nil. |

### `initializeButton()`

```swift
func initializeButton()
```

Initialize the button on macOS.

### `setLabel(_:)`

```swift
public func setLabel(_ title: String) -> Self
```

Set the button's label.
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

Set the button's label and icon.
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

### `setAction(_:)`

```swift
public func setAction(_ action: @escaping () -> Void) -> Self
```

Set the action that gets called when the button gets pressed.
- Parameter action: The action.
- Returns: The button.

#### Parameters

| Name | Description |
| ---- | ----------- |
| action | The action. |

### `disabled(_:)`

```swift
public func disabled(_ disabled: Bool = true) -> Self
```

Disable a button so that it cannot be clicked.
- Parameter disabled: Whether the button is disabled.
- Returns: The button.

#### Parameters

| Name | Description |
| ---- | ----------- |
| disabled | Whether the button is disabled. |

### `buttonPressed(_:)`

```swift
func buttonPressed(_ sender: Any?)
```

This function gets called when a button is pressed under macOS.
- Parameter sender: The sender or nil.

#### Parameters

| Name | Description |
| ---- | ----------- |
| sender | The sender or nil. |