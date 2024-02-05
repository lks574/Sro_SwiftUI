// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "TCABanking",
  platforms: [.iOS(.v17)],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
        name: "TCABanking",
        targets: ["TCABanking"]),
  ],
  dependencies: [
    .package(path: "../../Core/Architecture"),
    .package(path: "../../Core/Domain"),
    .package(path: "../../Core/Platform"),
    .package(path: "../../Core/DesignSystem"),
    .package(path: "../../Core/Functor"),
    .package(
      url: "https://github.com/pointfreeco/swift-composable-architecture",
      .upToNextMajor(from: "1.7.2")),
    .package(url: "https://github.com/pointfreeco/swiftui-navigation.git", from: "1.2.0"),
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "TCABanking",
      dependencies: [
        "Architecture",
        "Domain",
        "Platform",
        "DesignSystem",
        "Functor",
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
        .product(name: "SwiftUINavigation", package: "swiftui-navigation"),
      ]
    ),
    .testTarget(
        name: "TCABankingTests",
        dependencies: ["TCABanking"]
    ),
  ]
)
