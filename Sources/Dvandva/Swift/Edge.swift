//
//  Edge.swift
//  Dvandva
//
//  Created by david-swift on 12.11.2023.
//

#if !os(macOS)
import Libadwaita
#endif

/// The edge of e.g. a widget.
public enum Edge {

    /// The top edge.
    case top
    /// The bottom edge.
    case bottom
    /// The leading edge.
    case leading
    /// The trailing edge.
    case trailing

    #if !os(macOS)
    /// Get the edge as a Libadwaita Edge for Linux.
    var gtuiEdge: Libadwaita.Edge {
        switch self {
        case .top:
            return .top
        case .bottom:
            return .bottom
        case .leading:
            return .leading
        case .trailing:
            return .trailing
        }
    }
    #endif

}
