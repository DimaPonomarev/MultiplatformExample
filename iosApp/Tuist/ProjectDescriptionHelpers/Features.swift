import ProjectDescription

public enum Features: String, CaseIterable {
    case TMC = "TMC"

    public func getName() -> String {
        return self.rawValue
    }

    public func getFeaturePath() -> String {
        return "Features/\(self.getName())"
    }

    public func getInjectionPath() -> String {
        return "../\(self.getName())"
    }

    public static func getFeatures() -> [Path] {
        var result = Features.allCases.map { Path(stringLiteral: $0.getFeaturePath()) }
        result.append(.path("."))
        return result
    }

    public static func setAppInjections() -> [TargetDependency] {
        return Features.allCases.map { feature in
            .project(
                target: feature.getName(),
                path: .path(feature.getFeaturePath()),
                status: .required,
                condition: .none
            )
        }
    }
}
