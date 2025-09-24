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
            targets: ["PhosphorBinary"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "PhosphorBinary",
            url: "https://github.com/kouki-shito/swift-xc-phospor/releases/download/1.0.0/PhosphorBinary-1.0.0.xcframework.zip",
            checksum: "0f4a21397395ff8276cd74c5145cdcb095006c85b680a8108136e4aef132050d"
        )
    ]
)