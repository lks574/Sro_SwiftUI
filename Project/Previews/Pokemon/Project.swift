import ProjectDescription
import ProjectDescriptionHelpers

let project: Project = .previewProject(
  projectName: "Pokemon",
  packages: [
    .local(path: "../../Study/Pokemon"),
  ],
  dependencies: [
    .package(product: "Pokemon"),
  ])
