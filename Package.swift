// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OnPasteboard",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
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
