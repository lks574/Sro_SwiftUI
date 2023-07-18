// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Pokemon",
  platforms: [.iOS(.v15)],
  products: [
    .library(
      name: "Pokemon",
      targets: ["Pokemon"]),
  ],
  dependencies: [
    .package(path: "../../Core/Architecture"),
    .package(path: "../../Core/Domain"),
    .package(path: "../../Core/Platform"),
    .package(path: "../../Core/DesignSystem"),
    .package(path: "../../Core/Functor"),
    .package(
      url: "https://github.com/pointfreeco/swift-composable-architecture",
      .upToNextMajor(from: "0.56.0")),
  ],
  targets: [
    .target(
      name: "Pokemon",
      dependencies: [
        "Architecture",
        "Domain",
        "Platform",
        "DesignSystem",
        "Functor",
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
      ]
    ),
    .testTarget(
      name: "PokemonTests",
      dependencies: ["Pokemon"]),
  ]
)
