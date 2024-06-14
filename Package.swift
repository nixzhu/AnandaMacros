// swift-tools-version: 5.9

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "AnandaMacros",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
        .macCatalyst(.v13),
        .visionOS(.v1),
    ],
    products: [
        .library(
            name: "AnandaMacros",
            targets: ["AnandaMacros"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/nixzhu/Ananda.git",
            revision: "ca4d4dc97e6518305d92813af2588599a6118484"
        ),
        .package(
            url: "https://github.com/apple/swift-syntax.git",
            "509.0.0"..<"511.0.0"
        ),
    ],
    targets: [
        .macro(
            name: "AnandaMacrosProvider",
            dependencies: [
                .product(
                    name: "SwiftSyntaxMacros",
                    package: "swift-syntax"
                ),
                .product(
                    name: "SwiftCompilerPlugin",
                    package: "swift-syntax"
                ),
            ]
        ),
        .target(
            name: "AnandaMacros",
            dependencies: [
                "AnandaMacrosProvider",
                .product(
                    name: "Ananda",
                    package: "Ananda"
                ),
            ],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency"),
            ]
        ),
        .testTarget(
            name: "AnandaMacrosTests",
            dependencies: [
                "AnandaMacros",
                .product(
                    name: "SwiftSyntaxMacrosTestSupport",
                    package: "swift-syntax"
                ),
            ]
        ),
    ]
)
