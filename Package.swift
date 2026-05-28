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
        ),
        .library(
            name: "llmfarm_core_cpp",
            targets: ["llmfarm_core_cpp"]
        )
    ],
    targets: [
        
        // -------------------------
        // Binary XCFramework target
        // -------------------------
        .binaryTarget(
            name: "llama",
            path: "./llama.xcframework"
        ),

        // -------------------------
        // Swift wrapper target
        // -------------------------
        .target(
            name: "llmfarm_core",
            dependencies: [
                "llama",
                "llmfarm_core_cpp"
            ],
            path: "Sources/llmfarm_core",
            linkerSettings: [
                .linkedFramework("Accelerate")
            ]
        ),

        // -------------------------
        // C / C++ bridge layer
        // -------------------------
        .target(
            name: "llmfarm_core_cpp",
            path: "Sources/llmfarm_core_cpp",
            sources: [
                "package_helper.m",
                "exception_helper_objc.mm",
                "exception_helper.cpp"
            ],
            publicHeadersPath: "spm-headers",
            cxxSettings: [
                .unsafeFlags([
                    "-std=c++17"
                ])
            ]
        )
    ]
)
