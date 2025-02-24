// swift-tools-version: 6.1

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "RandomMacro",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
    products: [
        .library(name: "RandomMacro", targets: ["RandomMacro"]),
        .executable(name: "RandomMacroClient", targets: ["RandomMacroClient"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "600.0.0-latest"),
    ],
    targets: [
        .macro(
            name: "RandomMacroMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),
        .target(name: "RandomMacro", dependencies: ["RandomMacroMacros"]),
        .executableTarget(name: "RandomMacroClient", dependencies: ["RandomMacro"]),
        .testTarget(
            name: "RandomMacroTests",
            dependencies: [
                "RandomMacroMacros",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ]
        ),
    ]
)
