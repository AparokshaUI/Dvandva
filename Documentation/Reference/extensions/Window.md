**EXTENSION**

# `Window`
```swift
extension Window: NSToolbarDelegate
```

## Methods
### `toolbarDefaultItemIdentifiers(_:)`

```swift
public func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier]
```

The identifier of the toolbar items.
- Parameter toolbar: The toolbar.
- Returns: The identifiers.

#### Parameters

| Name | Description |
| ---- | ----------- |
| toolbar | The toolbar. |

### `toolbarAllowedItemIdentifiers(_:)`

```swift
public func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier]
```

The identifier of the toolbar items.
- Parameter toolbar: The toolbar.
- Returns: The identifiers.

#### Parameters

| Name | Description |
| ---- | ----------- |
| toolbar | The toolbar. |

### `toolbar(_:itemForItemIdentifier:willBeInsertedIntoToolbar:)`

```swift
public func toolbar(
    _ toolbar: NSToolbar,
    itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier,
    willBeInsertedIntoToolbar flag: Bool
) -> NSToolbarItem?
```

Get the toolbar item with a specific identifier.
- Parameters:
  - toolbar: The toolbar.
  - itemIdentifier: The toolbar item's identifier.
  - flag: Whether it will be inserted into the toolbar.
- Returns: The toolbar item.

#### Parameters

| Name | Description |
| ---- | ----------- |
| toolbar | The toolbar. |
| itemIdentifier | The toolbar item’s identifier. |
| flag | Whether it will be inserted into the toolbar. |

### `addToolbarItem(_:label:navigational:)`

```swift
public func addToolbarItem(_ widget: Widget, label: String, navigational: Bool = false)
```

Add a toolbar item to the window.
- Parameters:
  - widget: The widget.
  - label: The label for macOS.
  - navigational: Whether it is added to the left of the toolbar.

#### Parameters

| Name | Description |
| ---- | ----------- |
| widget | The widget. |
| label | The label for macOS. |
| navigational | Whether it is added to the left of the toolbar. |

### `setSidebar(_:)`

```swift
public func setSidebar(_ widget: Widget)
```

Add a sidebar to the window.
- Parameter widget: The sidebar's content.

#### Parameters

| Name | Description |
| ---- | ----------- |
| widget | The sidebar’s content. |

### `makeSimpleWindow(title:backgroundEffect:)`

```swift
public func makeSimpleWindow(title: Bool = true, backgroundEffect: Bool = false)
```

Transform the window into a "simple" window that is not resizable.
- Parameters:
  - title: Whether the title is visible on macOS.
  - backgroundEffect: Whether the background is blurry on macOS.

#### Parameters

| Name | Description |
| ---- | ----------- |
| title | Whether the title is visible on macOS. |
| backgroundEffect | Whether the background is blurry on macOS. |

### `makeNormalWindow()`

```swift
public func makeNormalWindow()
```

Transform a window into a "normal", resizable window.

### `makeNotBlurryWindow()`

```swift
func makeNotBlurryWindow()
```

Remove the blur effect from a window.

### `setContent()`

```swift
func setContent()
```

Update the window's content.

### `addChild(_:)`

```swift
public func addChild(_ child: Widget)
```

Add a child to the window's content view.
- Parameter child: The child.

#### Parameters

| Name | Description |
| ---- | ----------- |
| child | The child. |

### `setDefaultSize(width:height:)`

```swift
public func setDefaultSize(width: Int, height: Int)
```

Set the default size of the window.
- Parameters:
  - width: The window's width.
  - height: The window's height.

#### Parameters

| Name | Description |
| ---- | ----------- |
| width | The window’s width. |
| height | The window’s height. |

### `setMinimumSize(width:height:)`

```swift
public func setMinimumSize(width: Int, height: Int)
```

Set the window's minimum size for macOS.
- Parameters:
  - width: The window's minimum width.
  - height: The window's minimum height.

On Linux, the window can shrink to the content's size.

#### Parameters

| Name | Description |
| ---- | ----------- |
| width | The window’s minimum width. |
| height | The window’s minimum height. |

### `setMainMenu(_:)`

```swift
public func setMainMenu(_ menu: Menu)
```

Set the main menu of the window which is visible in the toolbar in GNOME.
- Parameter menu: The main menu.

#### Parameters

| Name | Description |
| ---- | ----------- |
| menu | The main menu. |

### `show()`

```swift
public func show()
```

Present the window.

### `close()`

```swift
public func close()
```

Close the window.
