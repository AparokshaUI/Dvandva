//
//  KeyboardShortcut.swift
//  Dvandva
//
//  Created by david-swift on 16.11.2023.
//

#if os(macOS)
import AppKit
#endif

/// A keyboard shortcut used e.g. in menus.
public struct KeyboardShortcut {

    /// A shortcut often use for "Delete" actions which is the "Delete" key on Linux and ⌘⌫ on macOS.
    public static var deleteShortcut: Self {
        #if os(macOS)
        .init(symbol: .backspace)
        #else
        .init(symbol: .delete, ctrl: false)
        #endif
    }

    /// The character or a sequence representing a letter or symbol.
    public var character: ShortcutCharacter
    /// Whether the Ctrl key is part of the shortcut.
    public var ctrl: Bool
    /// Whether the Shift key is part of the shortcut.
    public var shift: Bool
    /// Whether the Alt key is part of the shortcut.
    public var alt: Bool

    #if os(macOS)
    /// The modifiers for the macOS shortcut.
    var macModifiers: NSEvent.ModifierFlags {
        var flags: NSEvent.ModifierFlags = []
        if ctrl {
            flags.insert(.command)
        }
        if shift {
            flags.insert(.shift)
        }
        if alt {
            flags.insert(.option)
        }
        return flags
    }
    #endif

    /// The shortcut in a representation for Linux.
    var linuxShortcut: String {
        var string = ""
        if ctrl {
            string += "<Ctrl>"
        }
        if shift {
            string += "<Shift>"
        }
        if alt {
            string += "<Alt>"
        }
        string += character.linuxRepresentation
        return string
    }

    /// Initialize a keyboard shortcut.
    /// - Parameters:
    ///     - character: A letter.
    ///     - ctrl: Whether Ctrl is part of the shortcut.
    ///     - shift: Whether Shift is part of the shortcut.
    ///     - alt: Whether Alt is part of the shortcut.
    public init(_ character: Character, ctrl: Bool = true, shift: Bool = false, alt: Bool = false) {
        self.character = .character(character)
        self.ctrl = ctrl
        self.shift = shift
        self.alt = alt
    }

    /// Initialize a keyboard shortcut.
    /// - Parameters:
    ///     - symbol: A character.
    ///     - ctrl: Whether Ctrl is part of the shortcut.
    ///     - shift: Whether Shift is part of the shortcut.
    ///     - alt: Whether Alt is part of the shortcut.
    public init(symbol: ShortcutCharacter, ctrl: Bool = true, shift: Bool = false, alt: Bool = false) {
        self.character = symbol
        self.ctrl = ctrl
        self.shift = shift
        self.alt = alt
    }

    /// The special characters available for shortcuts.
    public enum ShortcutCharacter {

        /// The ⌫ character.
        case backspace
        /// The ⌦ character.
        case delete
        /// The ⇥ character.
        case tab
        /// The ⏎ character.
        case enter
        /// The ⎋ character.
        case escape
        /// The ␣ character.
        case space
        // swiftlint:disable identifier_name
        /// An arrow key.
        case up, down, left, right
        // swiftlint:enable identifier_name
        /// A custom character.
        case character(_ character: Character)

        /// A representation of the keys for macOS.
        var macOSRepresentation: String {
            switch self {
            case .backspace:
                return "\u{8}"
            case .delete:
                return "\u{7F}"
            case .tab:
                return "\u{9}"
            case .enter:
                return "\u{A}"
            case .escape:
                return "\u{1B}"
            case .space:
                return " "
            case .up:
                return "↑"
            case .down:
                return "↓"
            case .left:
                return "←"
            case .right:
                return "→"
            case let .character(character):
                return "\(character)"
            }
        }

        /// A representation of the keys for Linux.
        var linuxRepresentation: String {
            switch self {
            case .backspace:
                return "BackSpace"
            case .delete:
                return "Delete"
            case .tab:
                return "Tab"
            case .enter:
                return "Return"
            case .escape:
                return "Escape"
            case .space:
                return "space"
            case .up:
                return "Up"
            case .down:
                return "Down"
            case .left:
                return "Left"
            case .right:
                return "Right"
            case let .character(character):
                return "\(character)"
            }
        }

    }

}
