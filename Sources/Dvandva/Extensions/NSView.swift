//
//  NSView.swift
//  Dvandva
//
//  Created by david-swift on 19.11.2023.
//

#if os(macOS)
import AppKit

extension NSView {

    /// Equalize the top, bottom, leading and trailing anchors of two views.
    /// - Parameter view: Another view.
    func equalConstraints(_ view: NSView?) {
        if let view {
            NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: view.topAnchor),
                bottomAnchor.constraint(equalTo: view.bottomAnchor),
                leadingAnchor.constraint(equalTo: view.leadingAnchor),
                trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        }
    }

    /// Center a view inside of another.
    /// - Parameter view: One of the views.
    func center(_ view: NSView?) {
        if let view {
            NSLayoutConstraint.activate([
                centerXAnchor.constraint(equalTo: view.centerXAnchor),
                centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        }
    }

}
#endif
