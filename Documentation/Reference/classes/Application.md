**CLASS**

# `Application`

The application.

Do not initialize multiple apps per target.

## Properties
### `application`

The shared NSApplication for macOS.

### `mainMenu`

The app's main menu for macOS.

### `windowsItem`

The "Windows" menu for macOS.

### `helpItem`

The "Help" menu for macOS.

### `menuItemHandlers`

The handlers for menus for macOS.

### `actionIdentifiers`

Identifiers of the actions.

### `keyWindow`

The currently active window.

### `application`

The application for Linux.

### `keyWindow`

The currently active window.

### `appName`

The application's name.

### `appVersion`

The application's version string.

### `developer`

The application's developer.

### `helpURL`

The application's website for help.

### `issue`

The website for suggesting new features.

### `windows`

The available application windows.

## Methods
### `init(_:version:id:developer:)`

Initialize a new application.
- Parameters:
    - appName: The application's name.
    - version: The application's version string.
    - id: The application's identifier conforming to the GNOME app ID guidelines.
    - developer: The application's developer.

### `addMenu(_:menu:)`

Add a menu. 
On macOS, it appears in the menu bar.
On Linux, its actions are added to the app with the keyboard shortcuts.
You can use an action in any button in a menu 
by setting `id` to the label of the button holding the action in the menu bar instead of a closure.
- Parameters:
  - title: The title of the menu in the menu bar.
  - menu: The menu.

### `setHelp(url:)`

Set the URL displayed in the "Help" menu on macOS or in the "About" window on Linux.
- Parameter url: The help URL.

### `setIssue(url:)`

Set the URL displayed in the "Help" menu on macOS 
or in the "About" window on Linux for suggesting new features and reporting bugs.
- Parameter url: The issue URL.

### `run(_:)`

Run the application.
- Parameter modify: Every modification on the application should happen in this closure.

### `createDefaultMenus()`

Add the default menus to the menu bar.

### `about(_:)`

Open the about window.
- Parameter sender: The sender.

### `help(_:)`

Open the help URL.
- Parameter sender: The sender.

### `issue(_:)`

Open the issue URL.
- Parameter sender: The sender.

### `menuAction(_:)`

Execute an action in a menu.
- Parameter sender: The menu item that calls the action.

### `addDefaultShortcuts()`

Add the default keyboard shortcuts on Linux.
