// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OnPasteboard",
    platforms: [
        .macOS(.v11),
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "OnPasteboard",
            targets: ["OnPasteboard"]),
    ],
    targets: [
        .target(
            name: "OnPasteboard",
            dependencies: []),
        .testTarget(
            name: "OnPasteboardTests",
            dependencies: ["OnPasteboard"]),
    ]
)
