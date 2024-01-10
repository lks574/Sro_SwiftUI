import ProjectDescription
import ProjectDescriptionHelpers

let project: Project = .previewProject(
  projectName: "TCABanking",
  packages: [
    .local(path: "../../Study/TCABanking"),
  ],
  dependencies: [ 
    .package(product: "TCABanking"),
  ])
