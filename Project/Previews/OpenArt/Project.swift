import ProjectDescription
import ProjectDescriptionHelpers

let project: Project = .previewProject(
  projectName: "OpenArt",
  packages: [
    .local(path: "../../Study/OpenArt"),
  ],
  dependencies: [
    .package(product: "OpenArt"),
  ])
