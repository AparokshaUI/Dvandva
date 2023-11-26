//
//  List.swift
//  Dvandva
//
//  Created by david-swift on 18.11.2023.
//

#if os(macOS)
import AppKit
import SwiftUI
#else
import Libadwaita
#endif

/// A widget containing multiple items arranged in a list.
public class List: Widget {

    #if os(macOS)
    /// The list controller.
    private let controller = ViewController()
    #else
    /// The widget for Linux.
    private var list: ListBox? {
        get {
            widget as? ListBox
        }
        set {
            if let newValue {
                widget = newValue
            }
        }
    }
    #endif

    /// Initialize a list.
    override public init() {
        super.init()
        #if os(macOS)
        widget = controller.outlineView
        controller.setup()
        #else
        list = .init()
        #endif
    }

    #if os(macOS)
    /// A list view controller.
    class ViewController: NSObject, NSOutlineViewDelegate, NSOutlineViewDataSource {

        /// The list.
        let outlineView: NSOutlineView = .init()
        /// The widgets in the list.
        var items: [Widget] = [] {
            didSet {
                outlineView.reloadData()
            }
        }
        /// The functions observing changes in the selection.
        var selectionObservers: [(Int) -> Void] = []

        /// Execute when the view is set up.
        func setup() {
            outlineView.delegate = self
            outlineView.dataSource = self

            let col1 = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("Column1"))
            col1.title = "List"
            outlineView.headerView = nil
            outlineView.addTableColumn(col1)
            outlineView.translatesAutoresizingMaskIntoConstraints = false

            // Add notification observer for selection changes
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(selectionDidChange),
                name: NSOutlineView.selectionDidChangeNotification,
                object: outlineView
            )
        }

        /// Get the number of widgets in a list.
        /// - Parameters:
        ///   - outlineView: The list.
        ///   - item: Number of children.
        /// - Returns: Returns the number of widgets.
        func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
            items.count
        }

        /// Get the information that a list is not expandable.
        /// - Parameters:
        ///   - outlineView: The list.
        ///   - item: Is expandable.
        /// - Returns: Returns always false.
        func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
            false
        }

        /// Get the item at a certain index.
        /// - Parameters:
        ///   - outlineView: The list.
        ///   - index: The index.
        ///   - item: Get an item.
        /// - Returns: The item.
        func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
            items[index]
        }

        /// Get the view for a certain widget.
        /// - Parameters:
        ///   - outlineView: The list.
        ///   - tableColumn: The list column.
        ///   - item: The widget.
        /// - Returns: The widget's view.
        func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
            (item as? Widget)?.widget ?? .init()
        }

        /// Get the height a widget needs.
        /// - Parameters:
        ///   - outlineView: The list.
        ///   - item: The widget.
        /// - Returns: The widget's height.
        func outlineView(_ outlineView: NSOutlineView, heightOfRowByItem item: Any) -> CGFloat {
            if let widget = item as? Widget {
                return widget.widget.fittingSize.height
            }
            return .zero
        }

        /// Handle selection changes.
        @objc
        func selectionDidChange() {
            if let selectedIndex = outlineView.selectedRowIndexes.first {
                for selectionObserver in selectionObservers {
                    selectionObserver(selectedIndex)
                }
            }
        }

        /// Set the selection manually to a specific index.
        /// - Parameter index: The index.
        func setSelectedIndex(_ index: Int) {
            outlineView.selectRowIndexes(IndexSet(integer: index), byExtendingSelection: false)
        }

        /// Remove an item at a certain index.
        /// - Parameter index: The index.
        func removeAtIndex(_ index: Int) {
            outlineView.removeItems(at: [index], inParent: nil)
            items.remove(at: index)
        }
    }
    #endif

    /// Add a widget to the bottom of the list.
    /// - Parameter widget: The widget.
    /// - Returns: The list.
    public func append(_ widget: Widget) -> Self {
        #if os(macOS)
        controller.items.append(widget)
        #else
        _ = list?.append(widget.widget)
        #endif
        return self
    }

    /// Add a standard widget to the bottom of the list.
    /// - Parameters:
    ///   - label: The widget's label.
    ///   - icon: The widget's icon.
    /// - Returns: The list.
    ///
    /// A standard widget is a widget consisting of a label, and, on macOS, optionally an icon.
    public func append(label: String, icon: Icon?) -> Self {
        append(self.label(label, icon: icon))
    }

    /// Add a widget to the top of the list.
    /// - Parameter widget: The widget.
    /// - Returns: The list.
    public func prepend(_ widget: Widget) -> Self {
        #if os(macOS)
        controller.items.insert(widget, at: 0)
        #else
        _ = list?.prepend(widget.widget)
        #endif
        return self
    }

    /// Add a standard widget to the top of the list.
    /// - Parameters:
    ///   - label: The widget's label.
    ///   - icon: The widget's icon.
    /// - Returns: The list.
    ///
    /// A standard widget is a widget consisting of a label, and, on macOS, optionally an icon.
    public func prepend(label: String, icon: Icon?) -> Self {
        prepend(self.label(label, icon: icon))
    }

    /// Remove the widget at a certain index.
    /// - Parameter index: The index.
    /// - Returns: The list.
    public func remove(at index: Int) -> Self {
        #if os(macOS)
        controller.removeAtIndex(index)
        #else
        _ = list?.remove(at: index)
        #endif
        return self
    }

    /// Select the widget at a certain index.
    /// - Parameter index: The index.
    public func select(index: Int) {
        #if os(macOS)
        controller.setSelectedIndex(index)
        #else
        list?.selectRow(at: index)
        #endif
    }

    /// Add a closure that gets called when the selection changes.
    /// - Parameter observer: The function taking the selection index as a parameter.
    public func observeSelection(observer: @escaping (Int) -> Void) {
        #if os(macOS)
        controller.selectionObservers.append(observer)
        #else
        _ = list?.handler {
            if let index = self.list?.getSelectedRow() {
                observer(index)
            }
        }
        #endif
    }

    /// Get a standard widget consisting of a label and optionally an icon.
    /// - Parameters:
    ///   - label: The label.
    ///   - icon: The icon.
    /// - Returns: The widget.
    func label(_ label: String, icon: Icon?) -> Widget {
        let box = Box(horizontal: true)
        #if os(macOS)
        if let icon {
            let symbol = NSImageView(
                image: .init(systemSymbolName: icon.iconName, accessibilityDescription: nil) ?? .init()
            )
            symbol.contentTintColor = .controlAccentColor
            _ = box.append(NativeWrapper(symbol))
        }
        #endif
        let padding = 6
        return PaddingWrapper(box.append(Label().setText(label)))
            .setPadding(padding)
    }

}
