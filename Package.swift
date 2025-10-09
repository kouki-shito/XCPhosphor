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
            targets: ["XCPhosphor"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "XCPhosphor",
            url: "https://github.com/kouki-shito/swift-xc-phosphor/releases/download/1.0.1/PhosphorBinary.xcframework.zip",
            checksum: "52810c62557e6036be88b4cbcfbd3e8271367ef992abf95136c8e64a8776cd5b"
        )
    ]
)