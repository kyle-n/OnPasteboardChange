// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OnPasteboardChange",
    platforms: [
        .macOS(.v11),
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "OnPasteboardChange",
            targets: ["OnPasteboardChange"]),
    ],
    targets: [
        .target(
            name: "OnPasteboardChange",
            dependencies: []),
        .testTarget(
            name: "OnPasteboardChangeTests",
            dependencies: ["OnPasteboardChange"]),
    ]
)
