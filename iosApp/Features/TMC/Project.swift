import ProjectDescription
import ProjectDescriptionHelpers

// Sources live in the tmclibrary submodule (../../../tmclibrary/tmc-ios-ui/Sources),
// not under Features/TMC/Sources - referenced in place, not copied.
let project = Project.makeFeatureModule(
    name: Features.TMC.getName(),
    sources: [
        "../../../tmclibrary/tmc-ios-ui/Sources/Camera/**",
        "../../../tmclibrary/tmc-ios-ui/Sources/Infrastructure/**",
    ],
    scripts: [
        .pre(
            script: Scripts.embedTmcLibFramework,
            name: "Embed TmcLib Framework",
            basedOnDependencyAnalysis: false
        )
    ],
    dependencies: [
        .package(product: "EupUiKit")
    ],
    packages: [
        // Local path for now (matches the version testTmcLib was validated against, which
        // is ahead of the latest published uiios tag). Switch to the remote git URL once
        // EupUiKit's newer Theme API actually gets tagged and released.
        .package(path: "/Users/dima/uiios")
    ]
)
