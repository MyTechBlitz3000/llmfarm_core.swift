// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "llmfarm_core",
    platforms: [
        .macOS(.v11),
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "llmfarm_core",
            targets: ["llmfarm_core"]
        )
    ],
    targets: [
        .target(
            name: "llmfarm_core",
            path: "Sources/llmfarm_core"
        )
    ]
)
