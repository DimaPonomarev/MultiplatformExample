import ProjectDescription

// MARK: - Schemes
public extension Scheme {
    static func scheme(
        name: String,
        mainTargetName: String
    ) -> [Scheme] {
        let main: TargetReference = .target(mainTargetName)

        return [
            .scheme(
                name: name,
                shared: true,
                buildAction: .buildAction(targets: [main]),
                runAction: .runAction(
                    configuration: .debug,
                    executable: main
                ),
                archiveAction: .archiveAction(
                    configuration: .release,
                    customArchiveName: name
                )
            )
        ]
    }
}
