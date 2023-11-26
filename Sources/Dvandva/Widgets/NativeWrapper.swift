//
//  NativeWrapper.swift
//  Dvandva
//
//  Created by david-swift on 08.11.2023.
//

import Foundation

#if os(macOS)
import AppKit
#else
import Libadwaita
#endif

/// A wrapper around native widgets.
///
/// On macOS, it accepts an NSView,
/// and on Linux, you can use Libadwaita
/// (https://github.com/AparokshaUI/Libadwaita).
public class NativeWrapper: Widget {

#if os(macOS)
    /// Initialize a native wrapper for macOS.
    /// - Parameter nativeView: The NSView.
    public init(_ nativeView: NSView) {
        super.init()
        widget = nativeView
    }
#else
    /// Initialize a native wrapper for Linux.
    /// - Parameter nativeView: The class conforming to `Libadwaita.NativeWidgetPeer`.
    public init(_ nativeView: NativeWidgetPeer) {
        super.init()
        widget = nativeView
    }
#endif

}
