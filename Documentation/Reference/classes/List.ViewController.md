**CLASS**

# `List.ViewController`

```swift
class ViewController: NSObject, NSOutlineViewDelegate, NSOutlineViewDataSource
```

A list view controller.

## Properties
### `outlineView`

```swift
let outlineView: NSOutlineView = .init()
```

The list.

### `items`

```swift
var items: [Widget] = []
```

The widgets in the list.

### `selectionObservers`

```swift
var selectionObservers: [(Int) -> Void] = []
```

The functions observing changes in the selection.

## Methods
### `setup()`

```swift
func setup()
```

Execute when the view is set up.

### `outlineView(_:numberOfChildrenOfItem:)`

```swift
func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int
```

Get the number of widgets in a list.
- Parameters:
  - outlineView: The list.
  - item: Number of children.
- Returns: Returns the number of widgets.

#### Parameters

| Name | Description |
| ---- | ----------- |
| outlineView | The list. |
| item | Number of children. |

### `outlineView(_:isItemExpandable:)`

```swift
func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool
```

Get the information that a list is not expandable.
- Parameters:
  - outlineView: The list.
  - item: Is expandable.
- Returns: Returns always false.

#### Parameters

| Name | Description |
| ---- | ----------- |
| outlineView | The list. |
| item | Is expandable. |

### `outlineView(_:child:ofItem:)`

```swift
func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any
```

Get the item at a certain index.
- Parameters:
  - outlineView: The list.
  - index: The index.
  - item: Get an item.
- Returns: The item.

#### Parameters

| Name | Description |
| ---- | ----------- |
| outlineView | The list. |
| index | The index. |
| item | Get an item. |

### `outlineView(_:viewFor:item:)`

```swift
func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView?
```

Get the view for a certain widget.
- Parameters:
  - outlineView: The list.
  - tableColumn: The list column.
  - item: The widget.
- Returns: The widget's view.

#### Parameters

| Name | Description |
| ---- | ----------- |
| outlineView | The list. |
| tableColumn | The list column. |
| item | The widget. |

### `outlineView(_:heightOfRowByItem:)`

```swift
func outlineView(_ outlineView: NSOutlineView, heightOfRowByItem item: Any) -> CGFloat
```

Get the height a widget needs.
- Parameters:
  - outlineView: The list.
  - item: The widget.
- Returns: The widget's height.

#### Parameters

| Name | Description |
| ---- | ----------- |
| outlineView | The list. |
| item | The widget. |

### `selectionDidChange()`

```swift
func selectionDidChange()
```

Handle selection changes.

### `setSelectedIndex(_:)`

```swift
func setSelectedIndex(_ index: Int)
```

Set the selection manually to a specific index.
- Parameter index: The index.

#### Parameters

| Name | Description |
| ---- | ----------- |
| index | The index. |

### `removeAtIndex(_:)`

```swift
func removeAtIndex(_ index: Int)
```

Remove an item at a certain index.
- Parameter index: The index.

#### Parameters

| Name | Description |
| ---- | ----------- |
| index | The index. |