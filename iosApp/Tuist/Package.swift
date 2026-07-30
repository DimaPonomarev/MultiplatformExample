// swift-tools-version: 6.0
@preconcurrency import PackageDescription

#if TUIST
    import struct ProjectDescription.PackageSettings

    let packageSettings = PackageSettings(
        productTypes: [:]
    )
#endif

let package = Package(
    name: "MultiplatformExample",
    dependencies: [
        // Add SPM dependencies here, e.g.:
        // .package(url: "https://github.com/Alamofire/Alamofire", from: "5.0.0"),
    ]
)
