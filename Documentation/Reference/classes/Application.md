**CLASS**

# `Application`

```swift
public class Application
```

The application.

Do not initialize multiple apps per target.

## Properties
### `application`

```swift
let application: NSApplication = .shared
```

The shared NSApplication for macOS.

### `mainMenu`

```swift
let mainMenu: NSMenu = .init()
```

The app's main menu for macOS.

### `windowsItem`

```swift
let windowsItem = NSMenuItem(title: "Window", action: nil, keyEquivalent: "")
```

The "Windows" menu for macOS.

### `helpItem`

```swift
let helpItem = NSMenuItem(title: "Help", action: nil, keyEquivalent: "")
```

The "Help" menu for macOS.

### `menuItemHandlers`

```swift
var menuItemHandlers: [NSMenuItem: () -> Void] = [:]
```

The handlers for menus for macOS.

### `actionIdentifiers`

```swift
var actionIdentifiers: [String: NSMenuItem] = [:]
```

Identifiers of the actions.

### `keyWindow`

```swift
public var keyWindow: Window?
```

The currently active window.

### `application`

The application for Linux.

### `keyWindow`

The currently active window.

### `appName`

```swift
public var appName: String
```

The application's name.

### `appVersion`

```swift
public var appVersion: String
```

The application's version string.

### `developer`

```swift
var developer: String
```

The application's developer.

### `helpURL`

```swift
var helpURL: URL?
```

The application's website for help.

### `issue`

```swift
var issue: URL?
```

The website for suggesting new features.

### `windows`

```swift
var windows: [Window] = []
```

The available application windows.

## Methods
### `init(_:version:id:developer:)`

```swift
public init(_ appName: String, version: String, id: String, developer: String)
```

Initialize a new application.
- Parameters:
    - appName: The application's name.
    - version: The application's version string.
    - id: The application's identifier conforming to the GNOME app ID guidelines.
    - developer: The application's developer.

#### Parameters

| Name | Description |
| ---- | ----------- |
| appName | The application’s name. |
| version | The application’s version string. |
| id | The application’s identifier conforming to the GNOME app ID guidelines. |
| developer | The application’s developer. |

### `addMenu(_:menu:)`

```swift
public func addMenu(_ title: String, menu: Menu)
```

Add a menu. 
On macOS, it appears in the menu bar.
On Linux, its actions are added to the app with the keyboard shortcuts.
You can use an action in any button in a menu 
by setting `id` to the label of the button holding the action in the menu bar instead of a closure.
- Parameters:
  - title: The title of the menu in the menu bar.
  - menu: The menu.

#### Parameters

| Name | Description |
| ---- | ----------- |
| title | The title of the menu in the menu bar. |
| menu | The menu. |

### `setHelp(url:)`

```swift
public func setHelp(url: URL)
```

Set the URL displayed in the "Help" menu on macOS or in the "About" window on Linux.
- Parameter url: The help URL.

#### Parameters

| Name | Description |
| ---- | ----------- |
| url | The help URL. |

### `setIssue(url:)`

```swift
public func setIssue(url: URL)
```

Set the URL displayed in the "Help" menu on macOS 
or in the "About" window on Linux for suggesting new features and reporting bugs.
- Parameter url: The issue URL.

#### Parameters

| Name | Description |
| ---- | ----------- |
| url | The issue URL. |

### `run(_:)`

```swift
public func run(_ modify: @escaping () -> Void)
```

Run the application.
- Parameter modify: Every modification on the application should happen in this closure.

#### Parameters

| Name | Description |
| ---- | ----------- |
| modify | Every modification on the application should happen in this closure. |

### `createDefaultMenus()`

```swift
private func createDefaultMenus()
```

Add the default menus to the menu bar.

### `about(_:)`

```swift
func about(_ sender: Any?)
```

Open the about window.
- Parameter sender: The sender.

#### Parameters

| Name | Description |
| ---- | ----------- |
| sender | The sender. |

### `help(_:)`

```swift
func help(_ sender: Any?)
```

Open the help URL.
- Parameter sender: The sender.

#### Parameters

| Name | Description |
| ---- | ----------- |
| sender | The sender. |

### `issue(_:)`

```swift
func issue(_ sender: Any?)
```

Open the issue URL.
- Parameter sender: The sender.

#### Parameters

| Name | Description |
| ---- | ----------- |
| sender | The sender. |

### `menuAction(_:)`

```swift
func menuAction(_ sender: NSMenuItem?)
```

Execute an action in a menu.
- Parameter sender: The menu item that calls the action.

#### Parameters

| Name | Description |
| ---- | ----------- |
| sender | The menu item that calls the action. |

### `addDefaultShortcuts()`

Add the default keyboard shortcuts on Linux.
