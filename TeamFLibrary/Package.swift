// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TeamFLibrary",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "TeamFLibrary",
            targets: ["TeamFLibrary"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/yukiny0811/easy-utilities", from: "1.0.1"),
        .package(url: "git@github.com:MacPaw/OpenAI.git", from: "0.2.5")
    ],
    targets: [
        .target(
            name: "TeamFLibrary",
            dependencies: [
                .product(name: "EasyUtilities", package: "easy-utilities"),
                "OpenAI",
                "ChatGPTManager"
            ]
        ),
        .binaryTarget(name: "ChatGPTManager", path: "../ChatGPTManager.xcframework")
    ]
)

