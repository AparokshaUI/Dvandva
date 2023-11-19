//
//  Menu.swift
//  Dvandva
//
//  Created by david-swift on 01.11.2023.
//

#if os(macOS)
import AppKit
#else
import GTUI
#endif

/// A menu is a collection of buttons, organized in sections and submenus.
public class Menu {

#if os(macOS)
    /// The menu for macOS.
    private let menu: NSMenu = .init()
    /// The menu's content for macOS.
    var content: [(NSMenuItem, Menu?)] = []
#else
    /// The menu for Linux.
    private let menu: GTUI.Menu = .init()
    /// The menu's content for Linux.
    var content: [String: (KeyboardShortcut?, () -> Void)] = [:]
#endif

    /// Initialize a menu.
    public init() { }

    /// Add a button to a menu.
    /// - Parameters:
    ///   - label: The button's label.
    ///   - app: The application.
    ///   - shortcut: The button's keyboard shortcut.
    ///   - handler: Handle the action when the button is clicked or the shortcut is pressed.
    /// - Returns: The menu.
    public func addButton(
        _ label: String,
        app: Application,
        shortcut: KeyboardShortcut? = nil,
        handler: @escaping () -> Void
    ) -> Self {
        #if os(macOS)
        let menuItem = NSMenuItem(
            title: label,
            action: #selector(app.menuAction(_:)),
            keyEquivalent: shortcut?.character.macOSRepresentation ?? ""
        )
        menuItem.keyEquivalentModifierMask = shortcut?.macModifiers ?? []
        menuItem.target = app
        content.append((menuItem, nil))
        app.menuItemHandlers[menuItem] = handler
        app.actionIdentifiers[label] = menuItem
        #else
        _ = menu.append(label, app: app.application, shortcut: shortcut?.linuxShortcut ?? "", handler: handler)
        content[label] = (shortcut, handler)
        #endif
        return self
    }

    /// Add a button to a menu that runs an action specified in the menu bar or the app's actions.
    /// - Parameters:
    ///   - label: The button's label.
    ///   - app: The application.
    ///   - id: The label of the button that holds the original action.
    /// - Returns: The menu.
    public func addButton(_ label: String, app: Application, id: String) -> Self {
        #if os(macOS)
        if let item = app.actionIdentifiers[id], let handler = app.menuItemHandlers[item] {
            _ = addButton(label, app: app, handler: handler)
        }
        #else
        _ = menu.append(label, id: "app.\(id.linuxID)")
        #endif
        return self
    }

    /// Add a section to a menu.
    /// - Parameter menu: The menu in the section.
    /// - Returns: The menu.
    public func addSection(_ menu: Menu) -> Self {
        #if os(macOS)
        content.append((NSMenuItem.separator(), nil))
        content += menu.content
        #else
        _ = self.menu.append("", section: menu.menu)
        content.merge(menu.content) { first, _ in first }
        #endif
        return self
    }

    /// Add another menu inside this menu.
    /// - Parameters:
    ///   - label: The child menu's title.
    ///   - menu: The child menu.
    /// - Returns: The parent menu.
    public func addSubmenu(_ label: String, _ menu: Menu) -> Self {
        #if os(macOS)
        let menuItem = NSMenuItem(title: label, action: nil, keyEquivalent: "")
        content.append((menuItem, menu))
        #else
        _ = self.menu.append(label, submenu: menu.menu)
        content.merge(menu.content) { first, _ in first }
        #endif
        return self
    }

    #if os(macOS)
    /// Get the `NSMenu`.
    /// - Returns: The `NSMenu`.
    func getMenu() -> NSMenu {
        menu.items = content.map { $0.0 }
        for item in content {
            if let menu = item.1 {
                self.menu.setSubmenu(menu.getMenu(), for: item.0)
            }
        }
        return menu
    }
    #else
    /// Get the `GTUI.Menu`.
    /// - Returns: The `GTUI.Menu`.
    func getMenu() -> GTUI.Menu {
        menu
    }
    #endif

}
