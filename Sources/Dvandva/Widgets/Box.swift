//
//  Box.swift
//  Dvandva
//
//  Created by david-swift on 08.11.2023.
//

#if os(macOS)
import AppKit
#else
import Libadwaita
#endif

/// A widget containing multiple items either aligned horizontally or vertically.
public class Box: Widget {

#if os(macOS)
    /// The widget for macOS.
    private var box: NSStackView? {
        get {
            widget as? NSStackView
        }
        set {
            if let newValue {
                widget = newValue
            }
        }
    }
#else
    /// The widget for Linux.
    private var box: Libadwaita.Box? {
        get {
            widget as? Libadwaita.Box
        }
        set {
            if let newValue {
                widget = newValue
            }
        }
    }
#endif
    /// The widgets being arranged by the box widget.
    var content: [Widget] = []

    /// Initialize a box.
    /// - Parameter horizontal: Whether the box aligns its children horizontally or vertically.
    public init(horizontal: Bool = false) {
        super.init()
        #if os(macOS)
        box = .init()
        box?.orientation = horizontal ? .horizontal : .vertical
        #else
        box = .init(horizontal: horizontal)
        #endif
    }

    /// Add a widget to the trailing or bottom of the box.
    /// - Parameter widget: The widget.
    /// - Returns: The box.
    public func append(_ widget: Widget) -> Self {
        content.append(widget)
        #if os(macOS)
        box?.addArrangedSubview(widget.widget)
        #else
        _ = box?.append(widget.widget)
        #endif
        return self
    }

    /// Add a widget to the leading or top of the box.
    /// - Parameter widget: The widget.
    /// - Returns: The box.
    public func prepend(_ widget: Widget) -> Self {
        content.insert(widget, at: 0)
        #if os(macOS)
        box?.insertArrangedSubview(widget.widget, at: 0)
        #else
        _ = box?.prepend(widget.widget)
        #endif
        return self
    }

    /// Remove a certain widget from the view.
    /// - Parameter widget: The widget.
    public func removeWidget(_ widget: Widget) {
        #if os(macOS)
        box?.removeView(widget.widget)
        #else
        _ = box?.removeWidgets([widget.widget])
        #endif
    }

}
