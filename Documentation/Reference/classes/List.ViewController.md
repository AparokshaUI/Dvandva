**CLASS**

# `List.ViewController`

A list view controller.

## Properties
### `outlineView`

The list.

### `items`

The widgets in the list.

### `selectionObservers`

The functions observing changes in the selection.

## Methods
### `setup()`

Execute when the view is set up.

### `outlineView(_:numberOfChildrenOfItem:)`

Get the number of widgets in a list.
- Parameters:
  - outlineView: The list.
  - item: Number of children.
- Returns: Returns the number of widgets.

### `outlineView(_:isItemExpandable:)`

Get the information that a list is not expandable.
- Parameters:
  - outlineView: The list.
  - item: Is expandable.
- Returns: Returns always false.

### `outlineView(_:child:ofItem:)`

Get the item at a certain index.
- Parameters:
  - outlineView: The list.
  - index: The index.
  - item: Get an item.
- Returns: The item.

### `outlineView(_:viewFor:item:)`

Get the view for a certain widget.
- Parameters:
  - outlineView: The list.
  - tableColumn: The list column.
  - item: The widget.
- Returns: The widget's view.

### `outlineView(_:heightOfRowByItem:)`

Get the height a widget needs.
- Parameters:
  - outlineView: The list.
  - item: The widget.
- Returns: The widget's height.

### `selectionDidChange()`

Handle selection changes.

### `setSelectedIndex(_:)`

Set the selection manually to a specific index.
- Parameter index: The index.

### `removeAtIndex(_:)`

Remove an item at a certain index.
- Parameter index: The index.
