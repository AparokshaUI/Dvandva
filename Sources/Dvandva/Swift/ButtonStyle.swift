//
//  ButtonStyle.swift
//  Dvandva
//
//  Created by david-swift on 12.11.2023.
//

#if os(macOS)
import AppKit
#endif

/// The style of a button or another widget based on a button.
public enum ButtonStyle {

    /// A pill shape.
    case pill
    /// A circular shape.
    case circular
    /// The border is only available when being hovered.
    case flat

    #if !os(macOS)
    /// The name of the style for Linux.
    var styleName: String {
        switch self {
        case .pill:
            return "pill"
        case .circular:
            return "circular"
        case .flat:
            return "flat"
        }
    }
    #else
    /// Set the style of a button in macOS.
    /// - Parameter button: The button
    func buttonStyle(_ button: NSButton) {
        switch self {
        case .pill:
            button.bezelStyle = .badge
        case .circular:
            button.bezelStyle = .circular
        case .flat:
            button.bezelStyle = .toolbar
        }
    }
    #endif

}
