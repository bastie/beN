// swift-tools-version: 5.6

/*
 * SPDX-FileCopyrightText: 2022 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: MIT
 */

import PackageDescription
import Foundation

let package = Package(
    name: "beNerger",
    products: [
        .executable(name: "beN", targets: ["beNerger"]),
        .library(
            name: "libNerger",
            targets: ["libNerger"]),
    ],
    dependencies: [
    ],
    
    targets: [
        .executableTarget(
            name: "beNerger",
            dependencies: [
                "libNerger"
            ]),
        .testTarget(
            name: "beNergerTests",
            dependencies: ["beNerger"]),
        .target(name: "libNerger")
    ]
)
