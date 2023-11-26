//
//  MenuButton.swift
//  Dvandva
//
//  Created by david-swift on 16.11.2023.
//

#if os(macOS)
import AppKit
#else
import Libadwaita
#endif

/// A button that opens a menu when being pressed.
public class MenuButton: Widget {

#if os(macOS)
    /// The widget for macOS.
    let button: Button
#else
    /// The widget for Linux.
    private var button: Libadwaita.MenuButton? {
        get {
            widget as? Libadwaita.MenuButton
        }
        set {
            if let newValue {
                widget = newValue
            }
        }
    }
#endif
    /// The content.
    let menu: Menu = .init()

    /// Initialize a menu button.
    /// - Parameter title: The label of the button.
    ///
    /// Note that after initializing a button without an icon, you cannot add an icon.
    public init(_ title: String) {
        #if os(macOS)
        button = .init(title)
        #endif
        super.init()
        #if os(macOS)
        initButton()
        #else
        button = .init(title)
        #endif
    }

    /// Initialize a menu button.
    /// - Parameters:
    ///     - icon: The icon of the button.
    ///     - title: The label of the button, or nil.
    ///
    /// Note that after initializing a button with an icon, you cannot get rid of it.
    public init(_ icon: Icon, title: String? = nil) {
        #if os(macOS)
        button = .init(icon, title: title)
        #endif
        super.init()
        #if os(macOS)
        initButton()
        #else
        button = .init(title, icon: .custom(name: icon.iconName))
        #endif
    }

    /// Initialize the button.
    func initButton() {
        #if os(macOS)
        widget = button.widget
        _ = button.setAction {
            self.menu
                .getMenu()
                .popUp(
                    positioning: nil,
                    at: .init(
                        x: self.button.widget.frame.origin.x,
                        y: self.button.widget.frame.origin.y + self.button.widget.frame.size.height
                    ),
                    in: self.button.widget
                )
        }
        #else
        _ = button?.menu(menu.getMenu())
        #endif
    }

    /// Set the menu button's label.
    /// - Parameter title: The button's label.
    /// - Returns: The button.
    ///
    /// Note that this only has an effect when the button has been initialized without an icon.
    public func setLabel(_ title: String) -> Self {
        #if os(macOS)
        _ = button.setLabel(title)
        #else
        button?.setLabel(title)
        #endif
        return self
    }

    /// Set the menu button's label and icon.
    /// - Parameters:
    ///     - icon: The button's icon.
    ///     - title: The button's label, or nil.
    ///
    /// Note that this only has an effect when the button has been initialized with an icon.
    public func setLabel(_ icon: Icon, title: String? = nil) -> Self {
        #if os(macOS)
        _ = button.setLabel(icon, title: title)
        #else
        let content = button?.getContent()
        if let title {
            content?.setLabel(title)
        }
        content?.setIcon(.custom(name: icon.iconName))
        #endif
        return self
    }

    /// Set the button's style.
    /// - Parameter style: The button's style.
    /// - Returns: The button.
    public func buttonStyle(_ style: ButtonStyle) -> Self {
        #if os(macOS)
        _ = button.buttonStyle(style)
        #else
        _ = button?.addStyle(style.styleName)
        #endif
        return self
    }

    /// Edit the menu of the menu button.
    /// - Parameter menu: The closure for editing the menu.
    /// - Returns: The menu button.
    public func editMenu(_ menu: (Menu) -> Void) -> Self {
        menu(self.menu)
        #if !os(macOS)
        _ = button?.menu(self.menu.getMenu())
        #endif
        return self
    }

}
