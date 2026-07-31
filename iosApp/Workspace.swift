import ProjectDescription
import ProjectDescriptionHelpers

let workspace = Workspace(
    name: Constants.nameOfWorkspace,
    projects: Features.getFeatures()
)
