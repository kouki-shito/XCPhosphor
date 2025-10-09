// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-xc-phosphor",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "XCPhosphor",
            targets: ["Phosphor"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Phosphor",
            // dependencies: ["PhosphorBinary"]
        ),
        .binaryTarget(
            name: "PhosphorBinary",
            url: "https://github.com/kouki-shito/swift-xc-phospor/releases/download/0.0.1/PhosphorBinary.xcframework.zip",
            checksum: "94cef3cddc32de382a96e85a2b226a219fdabfc3eff9c9ba54e94f41591e4cdc"
        )
    ]
)