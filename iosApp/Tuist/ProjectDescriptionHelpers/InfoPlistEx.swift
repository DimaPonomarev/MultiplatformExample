import ProjectDescription

// MARK: - Configurations
public extension InfoPlist {
    static let custom: InfoPlist = .extendingDefault(with: [
        "CFBundleVersion": "$(CURRENT_PROJECT_VERSION)",
        "CFBundleShortVersionString": "$(MARKETING_VERSION)",
        "CFBundleDevelopmentRegion": "$(DEVELOPMENT_LANGUAGE)",
        "CFBundleName": "$(PRODUCT_NAME)",
        "CFBundleIdentifier": "$(PRODUCT_BUNDLE_IDENTIFIER)",
        "UILaunchScreen": [:],
        "UISupportedInterfaceOrientations": ["UIInterfaceOrientationPortrait"],
        "UISupportedInterfaceOrientations~ipad": ["UIInterfaceOrientationPortrait"],
    ])
}
