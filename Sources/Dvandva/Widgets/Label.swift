//
//  Label.swift
//  Dvandva
//
//  Created by david-swift on 03.11.2023.
//

#if os(macOS)
import AppKit
#else
import Libadwaita
#endif

/// A widget showing a piece of text.
public class Label: Widget {

#if os(macOS)
    /// The widget for macOS.
    private var label: NSTextField? {
        get {
            widget as? NSTextField
        }
        set {
            if let newValue {
                widget = newValue
            }
        }
    }
    /// The content in macOS.
    var content: [(NSMenuItem, Menu?)] = []
#else
    /// The widget for Linux.
    private var label: Libadwaita.Label? {
        get {
            widget as? Libadwaita.Label
        }
        set {
            if let newValue {
                widget = newValue
            }
        }
    }
#endif

    /// Initialize a label.
    override public init() {
        super.init()
        #if os(macOS)
        label = .init()
        label?.isEditable = false
        label?.isBezeled = false
        label?.drawsBackground = false
        #else
        label = .init("")
        #endif
    }

    /// Set the label's text.
    /// - Parameter text: The new text.
    /// - Returns: The label.
    public func setText(_ text: String) -> Self {
        #if os(macOS)
        label?.stringValue = text
        #else
        label?.setText(text)
        #endif
        return self
    }

    /// Set the label's font.
    /// - Parameter font: The label's font.
    /// - Returns: The label.
    public func setFont(_ font: Font) -> Self {
        #if os(macOS)
        label?.font = font.nsFont
        #else
        _ = label?.addStyle(font.styleName)
        #endif
        return self
    }

}
