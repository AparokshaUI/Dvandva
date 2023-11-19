//
//  Icon.swift
//  Dvandva
//
//  Created by david-swift on 12.11.2023.
//

/// An icon for widgets displaying icons.
public enum Icon {

    // swiftlint:disable missing_docs
    case plus
    case menu
    case avatar
    case warning
    case find
    case sidebar
    case reload
    case number
    // swiftlint:enable missing_docs
    /// An icon which has a different string for Linux and macOS.
    case platformDependent(linux: String, mac: String)
    /// An icon which has the same string for Linux and macOS.
    case platformIndependent(name: String)

    /// A string representing an icon.
    var iconName: String {
        #if os(macOS)
        switch self {
        case .plus:
            return "plus"
        case .menu:
            return "menucard"
        case .avatar:
            return "person.fill"
        case .warning:
            return "exclamationmark.triangle.fill"
        case .find:
            return "magnifyingglass"
        case .sidebar:
            return "sidebar.left"
        case .reload:
            return "arrow.clockwise"
        case .number:
            return "number"
        case let .platformDependent(linux: _, mac: mac):
            return mac
        case let .platformIndependent(name: name):
            return name
        }
        #else
        switch self {
        case .plus:
            return "list-add-symbolic"
        case .menu:
            return "open-menu-symbolic"
        case .avatar:
            return "avatar-default-symbolic"
        case .warning:
            return "dialog-warning-symbolic"
        case .find:
            return "edit-find-symbolic"
        case .sidebar:
            return "sidebar-show-symbolic"
        case .reload:
            return "view-refresh-symbolic"
        case .number:
            return "lang-include-symbolic"
        case let .platformDependent(linux: linux, mac: _):
            return linux
        case let .platformIndependent(name: name):
            return name
        }
        #endif
    }

}
