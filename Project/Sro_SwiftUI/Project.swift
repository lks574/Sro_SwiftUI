import ProjectDescription
import ProjectDescriptionHelpers

let targets: [Target] = [
  .init(
    name: "Sro-SwiftUI",
    destinations: .iOS,
    product: .app,
    bundleId: "com.sro.sro-swiftui",
    deploymentTargets: .iOS("15.0"),
    infoPlist: .extendingDefault(with: defaultInfoValue),
    sources: ["Sources/**"],
    resources: ["Resources/**"],
    scripts: [],
    dependencies: .default,
    settings: .settings()
  )
]

let project: Project = .init(
  name: "Sro-SwiftUI",
  organizationName: "Sro",
  packages: [
    .local(path: "../Core/Architecture"),
    .local(path: "../Core/Domain"),
    .local(path: "../Core/Platform"),
    .local(path: "../Core/DesignSystem"),
    .local(path: "../Core/Functor"),
    .local(path: "../Study/TCABanking"),
    .local(path: "../Study/Pokemon"),
  ],
  settings: .settings(),
  targets: targets,
  schemes: [])

extension [TargetDependency] {
  public static var `default`: Self {
    [
      .package(product: "Architecture"),
      .package(product: "Domain"),
      .package(product: "Platform"),
      .package(product: "DesignSystem"),
      .package(product: "Functor"),
      .package(product: "TCABanking"),
      .package(product: "Pokemon"),
    ]
  }
}

var defaultInfoValue: [String: Plist.Value] {
  [
    "CFBundleDevelopmentRegion": .string("$(DEVELOPMENT_LANGUAGE)"),
    "CFBundleDisplayName": .string("${PRODUCT_NAME}"),
    "CFBundleShortVersionString": .string(.appVersion()),
    "CFBundleVersion": .string(.appBuildVersion()),
    "LSHasLocalizedDisplayName": .boolean(true),
    "UIApplicationSupportsMultipleScenes": .boolean(false),
    "UISupportedInterfaceOrientations": .array([
      .string("UIInterfaceOrientationPortrait"),
    ]),
    "LSRequiresIPhoneOS": .boolean(true),
    "UIApplicationSceneManifest": .dictionary([
      "UIApplicationSupportsMultipleScenes": .boolean(true),
    ]),
    "UIApplicationSupportsIndirectInputEvents": .boolean(true),
    "UILaunchScreen": .dictionary([:]),
    "UISceneConfigurations": .dictionary([
      "UIApplicationSupportsMultipleScenes": .boolean(false),
      "UISceneConfigurations": .dictionary([
        "UIWindowSceneSessionRoleApplication": .array([.dictionary([
          "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate",
        ])]),
      ]),
    ]),
    "ITSAppUsesNonExemptEncryption": .boolean(false),
    "NSAppTransportSecurity": .dictionary([
      "NSAllowsArbitraryLoads": .boolean(true),
    ]),
    "NSUserTrackingUsageDescription": .string("Press [Allow] now to be the first to receive news about events tailored to you."),
    "CFBundleAllowMixedLocalizations": .boolean(true),
    "UIBackgroundModes": .array([.string("remote-notification")]),
  ]
}
