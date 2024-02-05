// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Architecture",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Architecture",
            targets: ["Architecture"]),
    ],
    dependencies: [
      .package(
        url: "https://github.com/pointfreeco/swift-composable-architecture",
        .upToNextMajor(from: "1.7.2")),
      .package(path: "../DesignSystem"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Architecture",
            dependencies: [
              .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
              "DesignSystem",
            ]
        ),
        .testTarget(
            name: "ArchitectureTests",
            dependencies: ["Architecture"]),
    ]
)
