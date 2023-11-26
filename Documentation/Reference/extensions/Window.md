**EXTENSION**

# `Window`

## Methods
### `toolbarDefaultItemIdentifiers(_:)`

The identifier of the toolbar items.
- Parameter toolbar: The toolbar.
- Returns: The identifiers.

### `toolbarAllowedItemIdentifiers(_:)`

The identifier of the toolbar items.
- Parameter toolbar: The toolbar.
- Returns: The identifiers.

### `toolbar(_:itemForItemIdentifier:willBeInsertedIntoToolbar:)`

Get the toolbar item with a specific identifier.
- Parameters:
  - toolbar: The toolbar.
  - itemIdentifier: The toolbar item's identifier.
  - flag: Whether it will be inserted into the toolbar.
- Returns: The toolbar item.

### `addToolbarItem(_:label:navigational:)`

Add a toolbar item to the window.
- Parameters:
  - widget: The widget.
  - label: The label for macOS.
  - navigational: Whether it is added to the left of the toolbar.

### `setSidebar(_:)`

Add a sidebar to the window.
- Parameter widget: The sidebar's content.

### `makeSimpleWindow(title:backgroundEffect:)`

Transform the window into a "simple" window that is not resizable.
- Parameters:
  - title: Whether the title is visible on macOS.
  - backgroundEffect: Whether the background is blurry on macOS.

### `makeNormalWindow()`

Transform a window into a "normal", resizable window.

### `makeNotBlurryWindow()`

Remove the blur effect from a window.

### `setContent()`

Update the window's content.

### `addChild(_:)`

Add a child to the window's content view.
- Parameter child: The child.

### `setDefaultSize(width:height:)`

Set the default size of the window.
- Parameters:
  - width: The window's width.
  - height: The window's height.

### `setMinimumSize(width:height:)`

Set the window's minimum size for macOS.
- Parameters:
  - width: The window's minimum width.
  - height: The window's minimum height.

On Linux, the window can shrink to the content's size.

### `setMainMenu(_:)`

Set the main menu of the window which is visible in the toolbar in GNOME.
- Parameter menu: The main menu.

### `show()`

Present the window.

### `close()`

Close the window.
