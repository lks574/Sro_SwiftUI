import ProjectDescription

extension DeploymentTarget {
  public static let defaultTarget: DeploymentTarget = .iOS(targetVersion: "15.0", devices: [.iphone, .ipad])
}
