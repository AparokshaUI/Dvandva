// swift-tools-version: 5.8
//
//  Package.swift
//  Dvandva
//
//  Created by david-swift on 28.10.23.
//

import PackageDescription

/// The dependencies for the Swift package.
let dependencies: [Package.Dependency]

#if os(macOS)
dependencies = []
#else
dependencies = [.package(url: "https://github.com/AparokshaUI/Libadwaita", from: "0.1.0")]
#endif

/// The dependencies for the "Dvandva" target.
let targetDependencies: [Target.Dependency]

#if os(macOS)
targetDependencies = []
#else
targetDependencies = [
    .product(name: "Libadwaita", package: "Libadwaita")
]
#endif

/// The Dvandva package.
let package = Package(
    name: "Dvandva",
    platforms: [
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "Dvandva",
            targets: ["Dvandva"]
        )
    ],
    dependencies: dependencies,
    targets: [
        .target(
            name: "Dvandva",
            dependencies: targetDependencies
        ),
        .executableTarget(
            name: "Test",
            dependencies: ["Dvandva"],
            path: "Tests"
        )
    ]
)
