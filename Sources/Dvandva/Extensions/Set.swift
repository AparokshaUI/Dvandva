//
//  Set.swift
//  Dvandva
//
//  Created by david-swift on 12.11.2023.
//

import Foundation

extension Set where Element == Edge {

    /// A set of the vertical and horizontal edges.
    public static var all: Self {
        vertical.union(horizontal)
    }

    /// A set of the top and bottom edge.
    public static var vertical: Self {
        top.union(bottom)
    }

    /// A set of the leading and trailing edge.
    public static var horizontal: Self {
        leading.union(trailing)
    }

    /// A set of the top edge.
    public static var top: Self {
        [.top]
    }

    /// A set of the bottom edge.
    public static var bottom: Self {
        [.bottom]
    }

    /// A set of the leading edge.
    public static var leading: Self {
        [.leading]
    }

    /// A set of the trailing edge.
    public static var trailing: Self {
        [.trailing]
    }

    /// Combine two sets of edges.
    /// - Parameter edges: The edges.
    /// - Returns: The combined set of edges.
    public func add(_ edges: Self) -> Self {
        self.union(edges)
    }

}
