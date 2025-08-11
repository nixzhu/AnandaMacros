// swift-tools-version: 6.0

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
            from: "1.1.0"
        ),
        .package(
            url: "https://github.com/swiftlang/swift-syntax.git",
            from: "600.0.0"
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
            ]
        ),
        .testTarget(
            name: "AnandaMacrosTests",
            dependencies: [
                "AnandaMacros",
                "AnandaMacrosProvider",
                .product(
                    name: "SwiftSyntaxMacrosTestSupport",
                    package: "swift-syntax"
                ),
            ]
        ),
    ]
)
