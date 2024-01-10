import Foundation
import ProjectDescription

extension Target {
  static func previewTarget(
    projectName: String,
    dependencies: [TargetDependency])
    -> Self
  {
    .init(
      name: "\(projectName)Preview",
      destinations: .iOS,
      product: .app,
      bundleId: "com.sro.sro-swiftui.\(projectName.lowercased()).preview",
      deploymentTargets: .iOS("15.0"),
      infoPlist: .extendingDefault(with: defaultInfoValue),
      sources: ["Sources/**"],
      resources: ["Resources/**"],
      scripts: [],
      dependencies: dependencies,
      settings: .settings()
    )
  }

  static func previewTestTarget(
    projectName: String)
    -> Self
  {
    .init(
      name: "\(projectName)PreviewTests",
      destinations: .iOS,
      product: .uiTests,
      bundleId: "com.sro.sro-swiftui.\(projectName.lowercased()).preview.tests",
      deploymentTargets: .iOS("15.0"),
      sources: ["Tests/**"],
      dependencies: [
        .target(name: "\(projectName)Preview"),
      ],
      settings: .settings()
    )
  }
}

extension [Scheme] {
  public static func testScheme(previewTestTarget: String) -> Self {
    [
      .init(
        name: "\(previewTestTarget)Preview",
        shared: true,
        hidden: false,
        buildAction: .init(targets: ["\(previewTestTarget)Preview"]),
        testAction: .targets(["\(previewTestTarget)PreviewTests"])),
    ]
  }
}

extension Project {
  public static func previewProject(
    projectName: String,
    packages: [Package],
    dependencies: [TargetDependency])
    -> Self
  {
    .init(
      name: "\(projectName)Preview",
      organizationName: "Sro",
      packages: packages,
      targets: [
        .previewTarget(projectName: projectName, dependencies: dependencies),
        .previewTestTarget(projectName: projectName),
      ],
      schemes: .testScheme(previewTestTarget: projectName))
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

extension String {

  public static func appVersion() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yy.MM.dd"
    formatter.locale = Locale(identifier: "ko_KR")
    return formatter.string(from: Date())
  }

  public static func appBuildVersion() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyyMMddHHmmsss"
    formatter.locale = Locale(identifier: "ko_KR")
    return formatter.string(from: Date())
  }
}
