import ProjectDescription

// MARK: - Configurations
public extension Settings {
    // MARK: - Settings for the main app target
    static let appTarget: Settings = .settings(
        base: [
            "CODE_SIGN_STYLE": "Automatic",
            "DEVELOPMENT_TEAM": "",
            "CURRENT_PROJECT_VERSION": "\(Constants.buildVersion)",
            "MARKETING_VERSION": "\(Constants.appVersion)",
        ],
        configurations: [
            .debug(
                name: .debug,
                settings: [
                    "SWIFT_OPTIMIZATION_LEVEL": "-Onone",
                    "SWIFT_ACTIVE_COMPILATION_CONDITIONS": "DEBUG",
                    "PRODUCT_BUNDLE_IDENTIFIER": "\(Constants.bundleIdApp)",
                ]
            ),
            .release(
                name: .release,
                settings: [
                    "SWIFT_OPTIMIZATION_LEVEL": "-O",
                    "SWIFT_ACTIVE_COMPILATION_CONDITIONS": "RELEASE",
                    "PRODUCT_BUNDLE_IDENTIFIER": "\(Constants.bundleIdApp)",
                ]
            ),
        ],
        defaultSettings: .recommended
    )

    // MARK: - Settings for feature modules
    static let moduleTarget: Settings = .settings(
        base: [
            "CODE_SIGN_STYLE": "Automatic",
            "DEVELOPMENT_TEAM": "",
            "CURRENT_PROJECT_VERSION": "\(Constants.buildVersion)",
            "MARKETING_VERSION": "\(Constants.appVersion)",
        ],
        configurations: [
            .debug(
                name: .debug,
                settings: [
                    "SWIFT_OPTIMIZATION_LEVEL": "-Onone",
                    "SWIFT_ACTIVE_COMPILATION_CONDITIONS": "DEBUG",
                    "BUILD_LIBRARY_FOR_DISTRIBUTION": "NO",
                ]
            ),
            .release(
                name: .release,
                settings: [
                    "SWIFT_OPTIMIZATION_LEVEL": "-O",
                    "SWIFT_ACTIVE_COMPILATION_CONDITIONS": "RELEASE",
                    "BUILD_LIBRARY_FOR_DISTRIBUTION": "YES",
                ]
            ),
        ],
        defaultSettings: .recommended
    )

    // MARK: - Default project-level settings (used for both app and feature projects)
    static let defaultProject: Settings = .settings(
        base: [
            "SDKROOT": "iphoneos",
            "CODE_SIGN_STYLE": "Automatic",
            "DEVELOPMENT_TEAM": "",
            "CURRENT_PROJECT_VERSION": "\(Constants.buildVersion)",
            "MARKETING_VERSION": "\(Constants.appVersion)",
        ],
        defaultSettings: .recommended
    )
}
