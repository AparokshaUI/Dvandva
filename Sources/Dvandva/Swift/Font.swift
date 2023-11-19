//
//  Font.swift
//  Dvandva
//
//  Created by david-swift on 08.11.2023.
//

#if os(macOS)
import AppKit
#endif

/// A text style.
public enum Font {

    /// The body text style.
    case body
    /// The title text style of a certain level.
    case title1, title2, title3
    /// The caption text style.
    case caption

    #if os(macOS)
    /// Get the font for macOS.
    var nsFont: NSFont {
        let font: NSFont
        switch self {
        case .body:
            font = .preferredFont(forTextStyle: .body)
        case .title1:
            font = .preferredFont(forTextStyle: .title1)
        case .title2:
            font = .preferredFont(forTextStyle: .title2)
        case .title3:
            font = .preferredFont(forTextStyle: .title3)
        case .caption:
            font = .preferredFont(forTextStyle: .caption2)
        }
        return self == .body || self == .caption ? font : NSFontManager.shared.convert(font, toHaveTrait: .boldFontMask)
    }
    #else
    /// Get the name of the font for Linux.
    var styleName: String {
        switch self {
        case .body:
            return "body"
        case .title1:
            return "title-1"
        case .title2:
            return "title-2"
        case .title3:
            return "title-3"
        case .caption:
            return "caption"
        }
    }
    #endif

}
