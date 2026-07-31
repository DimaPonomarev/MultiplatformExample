import ProjectDescription

public extension Project {
    // MARK: - Helper to create a feature module
    static func makeFeatureModule(
        name: String,
        platform: Destinations = .iOS,
        product: Product = .framework,
        sources: SourceFilesList = ["\(Constants.featureSourcePath)"],
        scripts: [TargetScript] = [],
        dependencies: [TargetDependency] = [],
        packages: [Package] = [],
        settings: Settings? = nil
    ) -> Project {
        return Project(
            name: name,
            packages: packages,
            settings: Settings.defaultProject,
            targets: [
                .target(
                    name: name,
                    destinations: platform,
                    product: product,
                    bundleId: Constants.bundleIdApp + "." + name.lowercased(),
                    deploymentTargets: .iOS(Constants.deploymentVersion),
                    infoPlist: .default,
                    sources: sources,
                    scripts: scripts,
                    dependencies: dependencies,
                    settings: settings ?? Settings.moduleTarget
                )
            ]
        )
    }

    // MARK: - Helper to create the main app
    static func makeAppModule(
        name: String,
        platform: Destinations = .iOS,
        product: Product = .app,
        dependencies: [TargetDependency] = []
    ) -> Project {
        // Needs to be a direct app dependency (not just transitive, via a feature module)
        // so Xcode actually embeds SharedApi.framework (EupUiKit's binary target) into
        // the app bundle - otherwise it links but isn't copied in, and the app crashes
        // at launch with "Library not loaded: @rpath/SharedApi.framework/SharedApi".
        var outsideDependencies = dependencies
        outsideDependencies.append(.package(product: "EupUiKit"))
        return Project(
            name: name,
            settings: Settings.defaultProject,
            targets: [
                .target(
                    name: name,
                    destinations: platform,
                    product: product,
                    bundleId: Constants.bundleIdApp,
                    deploymentTargets: .iOS(Constants.deploymentVersion),
                    infoPlist: .custom,
                    sources: ["\(Constants.appSourcePath)"],
                    resources: ["\(Constants.appResourcesPath)"],
                    scripts: [
                        .pre(
                            script: Scripts.embedSharedFramework,
                            name: "Embed Shared Framework",
                            basedOnDependencyAnalysis: false
                        )
                    ],
                    dependencies: outsideDependencies,
                    settings: Settings.appTarget
                )
            ],
            schemes: Scheme.scheme(name: name, mainTargetName: name)
        )
    }
}
