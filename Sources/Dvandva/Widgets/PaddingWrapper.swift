//
//  PaddingWrapper.swift
//  Dvandva
//
//  Created by david-swift on 09.11.2023.
//

#if os(macOS)
import AppKit
#else
import GTUI
#endif

/// A wrapper around a widget adding padding.
public class PaddingWrapper: Widget {

#if os(macOS)
    /// The content widget.
    private var content: Widget
#endif

    /// Initialize a padding wrapper around a widget.
    /// - Parameter content: The widget.
    public init(_ content: Widget) {
        #if os(macOS)
        self.content = content
        content.widget.wantsLayer = true
        content.widget.translatesAutoresizingMaskIntoConstraints = false
        #endif
        super.init()
        #if os(macOS)
        widget = .init()
        widget.addSubview(content.widget)
        #else
        widget = content.widget
        #endif
        _ = setPadding(0)
    }

    /// Customize the padding's size and the affected edges.
    /// - Parameters:
    ///     - padding: The padding's size.
    ///     - edges: The edges being affected by the padding wrapper.
    public func setPadding(_ padding: Int, edges: Set<Edge> = .all) -> Self {
        #if os(macOS)
        NSLayoutConstraint.deactivate(content.widget.constraints)
        NSLayoutConstraint.deactivate(widget.constraints)
        let padding = CGFloat(padding)
        let leading = content.widget.leadingAnchor.constraint(equalTo: widget.leadingAnchor, constant: padding)
        let trailing = content.widget.trailingAnchor.constraint(equalTo: widget.trailingAnchor, constant: -padding)
        let top = content.widget.topAnchor.constraint(equalTo: widget.topAnchor, constant: padding)
        let bottom = content.widget.bottomAnchor.constraint(equalTo: widget.bottomAnchor, constant: -padding)
        NSLayoutConstraint.activate(edges.map { edge in
            switch edge {
            case .top:
                return top
            case .leading:
                return leading
            case .bottom:
                return bottom
            case .trailing:
                return trailing
            }
        })
        #else
        _ = widget.padding(padding, .init(edges.map { $0.gtuiEdge }))
        #endif
        return self
    }

}
