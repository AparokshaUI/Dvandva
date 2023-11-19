//
//  String.swift
//  Dvandva
//
//  Created by david-swift on 16.11.2023.
//

#if !os(macOS)
import GTUI

extension String {

    /// Convert a string into a valid action ID.
    var linuxID: String {
        replacingOccurrences(of: " ", with: "_")
    }

}
#endif
