//
//  Widget.swift
//  Dvandva
//
//  Created by david-swift on 03.11.2023.
//

#if os(macOS)
import AppKit
#else
import Libadwaita
#endif

/// A widget is a view in a window.
public class Widget {

#if os(macOS)
    /// The widget as an `NSView`.
    public var widget: NSView = .init() {
        didSet {
            widget.translatesAutoresizingMaskIntoConstraints = false
        }
    }
#else
    // swiftlint:disable implicitly_unwrapped_optional
    /// The widget as a `Libadwaita.NativeWidgetPeer`.
    public var widget: NativeWidgetPeer!
    // swiftlint:enable implicitly_unwrapped_optional
#endif

}
