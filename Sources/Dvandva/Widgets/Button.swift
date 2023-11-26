//
//  Button.swift
//  Dvandva
//
//  Created by david-swift on 12.11.2023.
//

#if os(macOS)
import AppKit
#else
import Libadwaita
#endif

/// A widget executing an action when being clicked.
public class Button: Widget {

#if os(macOS)
    /// The widget for macOS.
    private var button: NSButton? {
        get {
            widget as? NSButton
        }
        set {
            if let newValue {
                widget = newValue
            }
        }
    }
#else
    /// The widget for Linux.
    private var button: Libadwaita.Button? {
        get {
            widget as? Libadwaita.Button
        }
        set {
            if let newValue {
                widget = newValue
            }
        }
    }
#endif
    /// The action that gets executed when the button gets pressed.
    var action: () -> Void = { }

    /// Initialize a button.
    /// - Parameter title: The label of the button.
    ///
    /// Note that after initializing a button without an icon, you cannot add an icon.
    public init(_ title: String) {
        super.init()
        #if os(macOS)
        initializeButton()
        _ = setLabel(title)
        #else
        button = .init(title)
        _ = button?.handler { self.action() }
        #endif
    }

    /// Initialize a button.
    /// - Parameters:
    ///     - icon: The icon of the button.
    ///     - title: The label of the button, or nil.
    ///
    /// Note that after initializing a button with an icon, you cannot get rid of it.
    public init(_ icon: Icon, title: String? = nil) {
        super.init()
        #if os(macOS)
        initializeButton()
        _ = setLabel(icon, title: title)
        #else
        button = .init(title, icon: .custom(name: icon.iconName))
        _ = button?.handler { self.action() }
        #endif
    }

    #if os(macOS)
    /// Initialize the button on macOS.
    func initializeButton() {
        button = .init()
        button?.action = #selector(buttonPressed(_:))
        button?.target = self
    }
    #endif

    /// Set the button's label.
    /// - Parameter title: The button's label.
    /// - Returns: The button.
    ///
    /// Note that this only has an effect when the button has been initialized without an icon.
    public func setLabel(_ title: String) -> Self {
        #if os(macOS)
        button?.title = title
        #else
        button?.setLabel(title)
        #endif
        return self
    }

    /// Set the button's label and icon.
    /// - Parameters:
    ///     - icon: The button's icon.
    ///     - title: The button's label, or nil.
    ///
    /// Note that this only has an effect when the button has been initialized with an icon.
    public func setLabel(_ icon: Icon, title: String? = nil) -> Self {
        #if os(macOS)
        button?.title = title ?? ""
        button?.image = .init(systemSymbolName: icon.iconName, accessibilityDescription: nil)
        button?.imagePosition = .imageLeading
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
        if let button {
            #if os(macOS)
            style.buttonStyle(button)
            #else
            _ = button.addStyle(style.styleName)
            #endif
        }
        return self
    }

    /// Set the action that gets called when the button gets pressed.
    /// - Parameter action: The action.
    /// - Returns: The button.
    public func setAction(_ action: @escaping () -> Void) -> Self {
        self.action = action
        return self
    }

    /// Disable a button so that it cannot be clicked.
    /// - Parameter disabled: Whether the button is disabled.
    /// - Returns: The button.
    public func disabled(_ disabled: Bool = true) -> Self {
        #if os(macOS)
        if disabled {
            button?.isEnabled = false
        } else {
            button?.isEnabled = true
        }
        #else
        _ = button?.sensitive(!disabled)
        #endif
        return self
    }

    #if os(macOS)
    /// This function gets called when a button is pressed under macOS.
    /// - Parameter sender: The sender or nil.
    @objc
    func buttonPressed(_ sender: Any?) {
        Task { @MainActor in
            action()
        }
    }
    #endif

}
