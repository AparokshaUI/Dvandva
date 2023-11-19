**CLASS**

# `Window.NavigationSplitViewController`

```swift
class NavigationSplitViewController: NSSplitViewController
```

A controller for a window's content with a sidebar.

## Properties
### `sidebar`

```swift
var sidebar: NSView = .init()
```

The sidebar view.

### `content`

```swift
var content: NSView = .init()
```

The content view.

## Methods
### `init(sidebar:content:)`

```swift
init(sidebar: NSView, content: NSView)
```

Initialize a controller for a window window's content with a sidebar.
- Parameters:
  - sidebar: The sidebar view.
  - content: The content view.

#### Parameters

| Name | Description |
| ---- | ----------- |
| sidebar | The sidebar view. |
| content | The content view. |

### `init(coder:)`

```swift
required init?(coder: NSCoder)
```

This initializer always fails.
- Parameter coder: An `NSCoder`.

#### Parameters

| Name | Description |
| ---- | ----------- |
| coder | An `NSCoder`. |

### `viewDidLoad()`

```swift
override func viewDidLoad()
```

Execute after the view has been loaded.
