//
//  Window.swift
//  Dvandva
//
//  Created by david-swift on 02.11.2023.
//

#if os(macOS)
import AppKit
#else
import GTUI
#endif

// swiftlint:disable no_grouping_extension

#if os(macOS)

/// A window is a container for widgets.
public class Window: NSObject, NSWindowDelegate {

    /// The window for macOS.
    let window: NSWindow = .init()
    /// The parent app for macOS.
    private let app: Application
    /// The window's toolbar for macOS.
    private let toolbar: NSToolbar
    /// The window's title.
    var title: String
    /// The widgets in the toolbar.
    var toolbarItemWidgets: [(String, (Widget, Bool))] = []
    /// Whether the window has a blurry background.
    var blurryBackground = false
    /// The window's content.
    var content: Box = .init()
    /// A view containing the window's content for macOS.
    let contentView: NSView = .init()
    /// The navigation split view for macOS.
    var splitView: NavigationSplitViewController?
    /// Whether the window's size has been set manually.
    var sizeSet = false
    /// A storage for custom data associated with the window.
    public var data: [String: Any] = [:]

    /// The toolbar items as `NSToolbarItem` for macOS.
    var toolbarItems: [NSToolbarItem] {
        toolbarItemWidgets.map { label, info in
            let toolbarItem = NSToolbarItem(itemIdentifier: .init(label))
            toolbarItem.isBordered = true
            toolbarItem.view = info.0.widget
            toolbarItem.isNavigational = info.1
            toolbarItem.label = label
            return toolbarItem
        }
    }

    // swiftlint:disable function_default_parameter_at_end
    /// Initialize a window.
    /// - Parameters:
    ///   - title: The window's title.
    ///   - id: The window's identifier.
    ///   - app: The app.
    public init(_ title: String? = nil, id: String, app: Application) {
        self.app = app
        let title = title ?? app.appName
        self.title = title
        self.toolbar = .init(identifier: id)
        super.init()
        app.windows.append(self)
        window.title = title
        window.delegate = self
        window.isReleasedWhenClosed = false
        contentView.addSubview(content.widget)
        window.contentView = contentView
        contentView.center(content.widget)
        makeNormalWindow()
    }
    // swiftlint:enable function_default_parameter_at_end

    /// A controller for a window's content with a sidebar.
    class NavigationSplitViewController: NSSplitViewController {

        /// The sidebar view.
        var sidebar: NSView = .init()
        /// The content view.
        var content: NSView = .init()

        /// Initialize a controller for a window window's content with a sidebar.
        /// - Parameters:
        ///   - sidebar: The sidebar view.
        ///   - content: The content view.
        init(sidebar: NSView, content: NSView) {
            self.sidebar.addSubview(sidebar)
            self.content.addSubview(content)
            super.init(nibName: nil, bundle: nil)
            sidebar.center(self.sidebar)
            content.center(self.content)
            self.sidebar.equalConstraints(sidebar)
            self.content.equalConstraints(content)
        }

        /// This initializer always fails.
        /// - Parameter coder: An `NSCoder`.
        required init?(coder: NSCoder) {
            nil
        }

        /// Execute after the view has been loaded.
        override func viewDidLoad() {
            super.viewDidLoad()

            let navigationViewController = NSViewController()
            navigationViewController.view = sidebar

            let detailViewController = NSViewController()
            detailViewController.view = content

            let splitViewItem1 = NSSplitViewItem(sidebarWithViewController: navigationViewController)
            let splitViewItem2 = NSSplitViewItem(viewController: detailViewController)

            addSplitViewItem(splitViewItem1)
            addSplitViewItem(splitViewItem2)
        }

    }

}

#else

/// A window is a container for widgets.
public class Window {

    /// The window for Linux.
    let window: GTUI.ApplicationWindow
    /// The window's content is an overlay split view.
    let content: GTUI.OverlaySplitView = .init()
    /// The "sub content" is the split view's content.
    let subContent: GTUI.Box = .init(horizontal: false)
    /// The window's header bar.
    let headerBar: GTUI.HeaderBar = .init()
    /// The parent application.
    let app: Application
    /// The window's title.
    var title: String
    /// A storage for custom data associated with the window.
    public var data: [String: Any] = [:]

    // swiftlint:disable function_default_parameter_at_end
    /// Initialize a window.
    /// - Parameters:
    ///   - title: The window's title.
    ///   - id: The window's identifier.
    ///   - app: The app.
    public init(_ title: String? = nil, id: String, app: Application) {
        window = .init(app: app.application)
        _ = content.content(ToolbarView(subContent).addTopBar(headerBar))
        content.hideSidebar()
        window.setChild(content)
        self.title = title ?? ""
        self.app = app
        app.windows.append(self)
        makeNormalWindow()
        _ = subContent.valign(.center)
        if let title {
          window.setTitle(title)
        }
    }
    // swiftlint:enable function_default_parameter_at_end

}

#endif

extension Window {

    /// Add a toolbar item to the window.
    /// - Parameters:
    ///   - widget: The widget.
    ///   - label: The label for macOS.
    ///   - navigational: Whether it is added to the left of the toolbar.
    public func addToolbarItem(_ widget: Widget, label: String, navigational: Bool = false) {
        #if os(macOS)
        if toolbarItemWidgets.isEmpty {
            window.toolbar = toolbar
            toolbar.displayMode = .iconOnly
            toolbar.delegate = self
        }
        toolbarItemWidgets.append((label, (widget, navigational)))
        toolbar.insertItem(withItemIdentifier: .init(label), at: toolbar.items.count)
        #else
        if navigational {
          _ = headerBar.packStart(widget.widget)
        } else {
          _ = headerBar.packEnd(widget.widget)
        }
        #endif
    }

    /// Add a sidebar to the window.
    /// - Parameter widget: The sidebar's content.
    public func setSidebar(_ widget: Widget) {
        #if os(macOS)
        window.styleMask.insert(.fullSizeContentView)
        splitView = .init(sidebar: ScrollView().setChild(widget).widget, content: contentView)
        window.contentViewController = splitView
        #else
        _ = content.sidebar(
          ToolbarView(Scrolled().setChild(widget.widget.addStyle("navigation-sidebar"))).addTopBar(HeaderBar())
        )
        content.showSidebar()
        _ = headerBar.titleWidget(GTUI.Label(""))
        #endif
    }

    /// Transform the window into a "simple" window that is not resizable.
    /// - Parameters:
    ///   - title: Whether the title is visible on macOS.
    ///   - backgroundEffect: Whether the background is blurry on macOS.
    public func makeSimpleWindow(title: Bool = true, backgroundEffect: Bool = false) {
        #if os(macOS)
        if title {
            window.titleVisibility = .visible
        } else {
            window.titleVisibility = .hidden
        }
        window.styleMask = [.titled, .closable, .fullSizeContentView]
        if backgroundEffect {
            window.standardWindowButton(.miniaturizeButton)?.isHidden = true
            window.standardWindowButton(.zoomButton)?.isHidden = true
            window.isMovableByWindowBackground = true
        } else {
            makeNotBlurryWindow()
        }
        window.titlebarAppearsTransparent = true
        blurryBackground = backgroundEffect
        setContent()
        #else
        window.setResizability(false)
        #endif
    }

    /// Transform a window into a "normal", resizable window.
    public func makeNormalWindow() {
        #if os(macOS)
        window.styleMask = [.titled, .closable, .miniaturizable, .resizable]
        window.titlebarAppearsTransparent = false
        window.titleVisibility = .visible
        blurryBackground = false
        setContent()
        #else
        window.setResizability(true)
        #endif
        makeNotBlurryWindow()
    }

    /// Remove the blur effect from a window.
    func makeNotBlurryWindow() {
        #if os(macOS)
        window.standardWindowButton(.miniaturizeButton)?.isHidden = false
        window.standardWindowButton(.zoomButton)?.isHidden = false
        window.isMovableByWindowBackground = false
        #endif
    }

    #if os(macOS)
    /// Update the window's content.
    func setContent() {
        if let splitView {
            window.contentViewController = splitView
            splitView.content.subviews = []
            splitView.content.addSubview(contentView)
            window.setContentSize(splitView.splitView.fittingSize)
        } else {
            if blurryBackground {
                let blurView = NSVisualEffectView()
                blurView.material = .menu
                blurView.blendingMode = .behindWindow
                window.contentView = blurView
                window.contentView?.addSubview(content.widget)
            } else {
                window.contentView = contentView
            }
            window.setContentSize(content.widget.fittingSize)
        }
        window.contentView?.wantsLayer = true
        window.contentView?.translatesAutoresizingMaskIntoConstraints = true
    }
    #endif

    /// Add a child to the window's content view.
    /// - Parameter child: The child.
    public func addChild(_ child: Widget) {
        #if os(macOS)
        _ = content.append(child)
        setContent()
        #else
        _ = subContent.append(child.widget)
        #endif
    }

    /// Set the default size of the window.
    /// - Parameters:
    ///   - width: The window's width.
    ///   - height: The window's height.
    public func setDefaultSize(width: Int, height: Int) {
        #if os(macOS)
        let frame = CGRect(x: 0, y: 0, width: width, height: height)
        window.setFrame(frame, display: true)
        sizeSet = true
        #else
        window.setDefaultSize(width: width, height: height)
        #endif
    }

    /// Set the window's minimum size for macOS.
    /// - Parameters:
    ///   - width: The window's minimum width.
    ///   - height: The window's minimum height.
    ///
    /// On Linux, the window can shrink to the content's size.
    public func setMinimumSize(width: Int, height: Int) {
        #if os(macOS)
        window.minSize = .init(width: width, height: height)
        #endif
    }

    /// Set the main menu of the window which is visible in the toolbar in GNOME.
    /// - Parameter menu: The main menu.
    public func setMainMenu(_ menu: Menu) {
        #if !os(macOS)
        _ = headerBar
            .append(
                GTUI.MenuButton(icon: .default(icon: .openMenu))
                    .menu(
                        menu.getMenu().append(
                            "",
                            section: .init()
                                .append("About \(app.appName)", app: app.application) {
                                    let about = AboutWindow(parent: self.window)
                                    _ = about.generalData(
                                        title: self.app.appName,
                                        icon: .custom(name: ""),
                                        developer: self.app.developer,
                                        version: self.app.appVersion
                                    )
                                    if let help = self.app.helpURL?.absoluteString {
                                        _ = about.support(url: help)
                                    }
                                    if let issue = self.app.issue?.absoluteString {
                                        _ = about.issue(url: issue)
                                    }
                                    about.show()
                                }
                                .append("Quit", id: "app.quit")
                        )
                    )
            )
        #endif
    }

    /// Present the window.
    public func show() {
        #if os(macOS)
        if !sizeSet && splitView != nil {
            let defaultWidth = 500
            let defaultHeight = 350
            setDefaultSize(width: defaultWidth, height: defaultHeight)
        }
        window.makeKeyAndOrderFront(nil)
        app.application.run()
        #else
        window.show()
        #endif
    }

    /// Close the window.
    public func close() {
        window.close()
        #if os(macOS)
        app.windows = app.windows.filter { $0.window != window }
        #else
        app.windows = app.windows.filter { $0.window.nativePtr != window.nativePtr }
        #endif
    }

}

// swiftlint:enable no_grouping_extension
