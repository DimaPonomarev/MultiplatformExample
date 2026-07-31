import ProjectDescription

public enum Scripts {
    public static let embedSharedFramework = """
    cd "$SRCROOT/.."
    ./gradlew :shared:embedAndSignAppleFrameworkForXcode
    """

    public static let embedTmcLibFramework = """
    cd "$SRCROOT/../../.."
    ./gradlew :tmclibrary:tmclib:embedAndSignAppleFrameworkForXcode
    """
}
