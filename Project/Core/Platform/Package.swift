// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Platform",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Platform",
            targets: ["Platform"]),
    ],
    dependencies: [
      .package(path: "../Domain"),
      .package(path: "../Functor"),
      .package(
        url: "https://github.com/Alamofire/Alamofire.git",
        .upToNextMajor(from: "5.7.1")),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Platform",
            dependencies: [
              "Domain",
              "Functor",
              "Alamofire",
            ]
        ),
        .testTarget(
            name: "PlatformTests",
            dependencies: ["Platform"]),
    ]
)
