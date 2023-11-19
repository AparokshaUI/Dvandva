//
//  Window+.swift
//  Dvandva
//
//  Created by david-swift on 19.11.2023.
//

#if os(macOS)
import AppKit

extension Window: NSToolbarDelegate {

    /// The identifier of the toolbar items.
    /// - Parameter toolbar: The toolbar.
    /// - Returns: The identifiers.
    public func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        toolbarItems.map { $0.itemIdentifier }
    }

    /// The identifier of the toolbar items.
    /// - Parameter toolbar: The toolbar.
    /// - Returns: The identifiers.
    public func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        toolbarItems.map { $0.itemIdentifier }
    }

    /// Get the toolbar item with a specific identifier.
    /// - Parameters:
    ///   - toolbar: The toolbar.
    ///   - itemIdentifier: The toolbar item's identifier.
    ///   - flag: Whether it will be inserted into the toolbar.
    /// - Returns: The toolbar item.
    public func toolbar(
        _ toolbar: NSToolbar,
        itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier,
        willBeInsertedIntoToolbar flag: Bool
    ) -> NSToolbarItem? {
        toolbarItems.first { $0.itemIdentifier == itemIdentifier }
    }

}
#endif
