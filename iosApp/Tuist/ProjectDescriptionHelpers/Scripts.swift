import ProjectDescription

public enum Scripts {
    public static let embedSharedFramework = """
    cd "$SRCROOT/.."
    ./gradlew :shared:embedAndSignAppleFrameworkForXcode
    """
}
