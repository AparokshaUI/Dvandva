//
//  Application.swift
//  Dvandva
//
//  Created by david-swift on 01.11.2023.
//

#if os(macOS)
import AppKit
#else
import Foundation
import Libadwaita
#endif

/// The application.
/// 
/// Do not initialize multiple apps per target.
public class Application {

#if os(macOS)
    /// The shared NSApplication for macOS.
    let application: NSApplication = .shared
    /// The app's main menu for macOS.
    let mainMenu: NSMenu = .init()
    /// The "Windows" menu for macOS.
    let windowsItem = NSMenuItem(title: "Window", action: nil, keyEquivalent: "")
    /// The "Help" menu for macOS.
    let helpItem = NSMenuItem(title: "Help", action: nil, keyEquivalent: "")
    /// The handlers for menus for macOS.
    var menuItemHandlers: [NSMenuItem: () -> Void] = [:]
    /// Identifiers of the actions.
    var actionIdentifiers: [String: NSMenuItem] = [:]
    /// The currently active window.
    public var keyWindow: Window? {
        windows.first { $0.window == application.keyWindow }
    }
#else
    /// The application for Linux.
    public let application: LibadwaitaApp
    /// The currently active window.
    public var keyWindow: Window? {
        windows.first { $0.window.nativePtr == application.getActiveWindow() }
    }
#endif
    /// The application's name.
    public var appName: String
    /// The application's version string.
    public var appVersion: String
    /// The application's developer.
    var developer: String
    /// The application's website for help.
    var helpURL: URL?
    /// The website for suggesting new features.
    var issue: URL?
    /// The available application windows.
    var windows: [Window] = []

    /// Initialize a new application.
    /// - Parameters:
    ///     - appName: The application's name.
    ///     - version: The application's version string.
    ///     - id: The application's identifier conforming to the GNOME app ID guidelines.
    ///     - developer: The application's developer.
    public init(_ appName: String, version: String, id: String, developer: String) {
        self.appName = appName
        appVersion = version
        self.developer = developer
        #if !os(macOS)
        self.application = .init(name: id)
        #endif
        #if os(macOS)
        createDefaultMenus()
        #else
        application.actions.append(addDefaultShortcuts)
        #endif
    }

    #if !os(macOS)
    /// The Libadwaita Application type for an application in Dvandva.
    public class LibadwaitaApp: Libadwaita.Application {

        /// Actions to run when being activated.
        var actions: [() -> Void] = []

        /// Run this function when being activated before being executed.
        override public func onActivate() {
            for action in actions {
                action()
            }
        }

    }
    #endif

    /// Add a menu. 
    /// On macOS, it appears in the menu bar.
    /// On Linux, its actions are added to the app with the keyboard shortcuts.
    /// You can use an action in any button in a menu 
    /// by setting `id` to the label of the button holding the action in the menu bar instead of a closure.
    /// - Parameters:
    ///   - title: The title of the menu in the menu bar.
    ///   - menu: The menu.
    public func addMenu(_ title: String, menu: Menu) {
        #if os(macOS)
        let item = NSMenuItem(title: title, action: nil, keyEquivalent: "")
        mainMenu.addItem(item)
        mainMenu.setSubmenu(menu.getMenu(), for: item)
        mainMenu.removeItem(windowsItem)
        mainMenu.addItem(windowsItem)
        mainMenu.removeItem(helpItem)
        mainMenu.addItem(helpItem)
        #else
        for action in menu.content {
            application.addKeyboardShortcut(
                action.value.0?.linuxShortcut ?? "",
                id: action.key.linuxID,
                handler: action.value.1
            )
        }
        #endif
    }

    /// Set the URL displayed in the "Help" menu on macOS or in the "About" window on Linux.
    /// - Parameter url: The help URL.
    public func setHelp(url: URL) {
        helpURL = url
    }

    /// Set the URL displayed in the "Help" menu on macOS 
    /// or in the "About" window on Linux for suggesting new features and reporting bugs.
    /// - Parameter url: The issue URL.
    public func setIssue(url: URL) {
        issue = url
    }

    /// Run the application.
    /// - Parameter modify: Every modification on the application should happen in this closure.
    public func run(_ modify: @escaping () -> Void) {
        #if os(macOS)
        modify()
        #else
        application.actions.append(modify)
        #endif
        application.run()
    }

    #if os(macOS)
    /// Add the default menus to the menu bar.
    private func createDefaultMenus() {
        let appMenu = NSMenu()
        let helpMenu = NSMenu()
        let windowsMenu = NSMenu()

        let aboutButton = NSMenuItem(title: "About \(appName)", action: #selector(self.about(_:)), keyEquivalent: "")
        aboutButton.target = self
        appMenu.addItem(aboutButton)

        appMenu.addItem(NSMenuItem.separator())
        appMenu.addItem(withTitle: "Hide \(appName)", action: #selector(NSApplication.hide(_:)), keyEquivalent: "h")
        appMenu.addItem(
            withTitle: "Hide Others",
            action: #selector(NSApplication.hideOtherApplications(_:)),
            keyEquivalent: "H"
        )
        appMenu.addItem(
            withTitle: "Show All",
            action: #selector(NSApplication.unhideAllApplications(_:)),
            keyEquivalent: ""
        )
        appMenu.addItem(NSMenuItem.separator())
        appMenu.addItem(
            withTitle: "Quit \(appName)",
            action: #selector(NSApplication.terminate(_:)),
            keyEquivalent: "q"
        )

        let helpButton = NSMenuItem(title: "\(appName) Help", action: #selector(help(_:)), keyEquivalent: "")
        helpButton.target = self
        helpMenu.addItem(helpButton)

        let issueButton = NSMenuItem(title: "Report an Issue", action: #selector(issue(_:)), keyEquivalent: "")
        issueButton.target = self
        helpMenu.addItem(issueButton)

        let appItem = NSMenuItem(title: appName, action: nil, keyEquivalent: "")
        mainMenu.addItem(appItem)
        mainMenu.setSubmenu(appMenu, for: appItem)

        mainMenu.addItem(windowsItem)
        mainMenu.setSubmenu(windowsMenu, for: windowsItem)

        mainMenu.addItem(helpItem)
        mainMenu.setSubmenu(helpMenu, for: helpItem)

        application.mainMenu = mainMenu
        application.helpMenu = helpMenu
        application.windowsMenu = windowsMenu
    }

    /// Open the about window.
    /// - Parameter sender: The sender.
    @objc
    func about(_ sender: Any?) {
        let aboutWindow = Window("About \(appName)", id: "about", app: self)
        aboutWindow.makeSimpleWindow(title: false, backgroundEffect: true)
        let view = NSImageView(image: NSApp.applicationIconImage ?? .init())
        let box = Box()
            .append(NativeWrapper(view))
            .append(Label().setText(appName).setFont(.title1))
            .append(Label().setText(developer))
            .append(Button(appVersion).buttonStyle(.pill).disabled())
        let padding = 20
        aboutWindow.addChild(PaddingWrapper(box).setPadding(padding))
        aboutWindow.show()
    }

    /// Open the help URL.
    /// - Parameter sender: The sender.
    @objc
    func help(_ sender: Any?) {
        if let helpURL {
            NSWorkspace.shared.open(helpURL)
        }
    }

    /// Open the issue URL.
    /// - Parameter sender: The sender.
    @objc
    func issue(_ sender: Any?) {
        if let issue {
            NSWorkspace.shared.open(issue)
        }
    }

    /// Execute an action in a menu.
    /// - Parameter sender: The menu item that calls the action.
    @objc
    func menuAction(_ sender: NSMenuItem?) {
        if let sender {
            menuItemHandlers[sender]?()
        }
    }
    #else
    /// Add the default keyboard shortcuts on Linux.
    private func addDefaultShortcuts() {
        application.addKeyboardShortcut("q".ctrl(), id: "quit") {
            self.application.quit()
        }
    }
    #endif

}
