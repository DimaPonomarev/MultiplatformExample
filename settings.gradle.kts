pluginManagement {
    repositories {
        google()
        gradlePluginPortal()
        mavenCentral()
        maven { url = uri("https://nexus.europlan.ru/repository/maven/") }
        maven { url = uri("https://nexus.europlan.ru/repository/maven-google/") }
        maven { url = uri("https://nexus.europlan.ru/repository/maven-jitpack/") }
    }
    includeBuild("tmclibrary/conventions")
}

dependencyResolutionManagement {
    repositories {
        google()
        mavenCentral()
        maven { url = uri("https://nexus.europlan.ru/repository/maven/") }
        maven { url = uri("https://nexus.europlan.ru/repository/maven-google/") }
        maven { url = uri("https://nexus.europlan.ru/repository/maven-jitpack/") }
        maven {
            url = uri("https://proget.europlan.ru/maven2/maven")
            isAllowInsecureProtocol = true
            credentials {
                username = "publisher"
                password = "EuroplanPublisher"
            }
        }
    }
}

rootProject.name = "MultiPlatformExample"
include(":androidApp")
include(":shared")

include(":tmclibrary:core-common")
include(":tmclibrary:core-domain")
include(":tmclibrary:core-infrastructure")
include(":tmclibrary:tmc-domain")
include(":tmclibrary:tmc-infrastructure")
include(":tmclibrary:tmc-feature-tasksList")
include(":tmclibrary:tmc-feature-taskSettings")
include(":tmclibrary:tmc-feature-inspectionService")
include(":tmclibrary:tmclib")
include(":tmclibrary:tmc-android-ui")

// tmclibrary is a git submodule that also carries its own root build.gradle.kts
// (so it can be built completely standalone). Point the auto-created aggregator
// project at a build file that doesn't exist so Gradle treats it as empty,
// instead of picking up the standalone repo's own plugin/buildscript setup.
project(":tmclibrary").buildFileName = "build.gradle.kts.standalone-only"