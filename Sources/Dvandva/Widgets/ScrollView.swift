//
//  ScrollView.swift
//  Dvandva
//
//  Created by david-swift on 19.11.2023.
//

import Foundation

#if os(macOS)
import AppKit
#else
import Libadwaita
#endif

/// A scrollable widget containing a child widget.
public class ScrollView: Widget {

    #if os(macOS)
    /// The widget for macOS.
    private var view: NSScrollView? {
        get {
            widget as? NSScrollView
        }
        set {
            if let newValue {
                widget = newValue
            }
        }
    }
    /// The child widget.
    var child: Widget?
    #else
    /// The scroll view.
    private var view: Scrolled? {
        get {
            widget as? Scrolled
        }
        set {
            if let newValue {
                widget = newValue
            }
        }
    }
    #endif

    /// Initialize the scrollable widget.
    override public init() {
        super.init()
        view = .init()
        #if os(macOS)
        view?.drawsBackground = false
        #endif
    }

    /// Set the `ScrollView`'s child.
    /// - Parameter widget: The child.
    /// - Returns: The scrollable widget.
    public func setChild(_ widget: Widget) -> Self {
        #if os(macOS)
        child = widget
        view?.documentView = widget.widget
        #else
        _ = view?.setChild(widget.widget)
        #endif
        return self
    }

}
