plugins {
    //trick: for the same plugin versions in all sub-modules
    alias(libs.plugins.androidApplication).apply(false)
    alias(libs.plugins.androidLibrary).apply(false)
    alias(libs.plugins.kotlinAndroid).apply(false)
    alias(libs.plugins.kotlinMultiplatform).apply(false)
    alias(libs.plugins.compose.compiler).apply(false)
}

// tmclibrary's own modules apply bare plugin ids (kotlinx-serialization, kotlin-parcelize,
// kotlin-kapt, dev.icerock.mobile.multiplatform-network-generator, io.realm.kotlin) without
// an explicit version. Putting these on the root buildscript classpath is what lets Gradle
// resolve those bare ids - same fix already applied in mws's own root build.gradle.kts.
buildscript {
    repositories {
        maven { url = uri("https://nexus.europlan.ru/repository/maven/") }
        maven { url = uri("https://nexus.europlan.ru/repository/maven-google/") }
        maven { url = uri("https://nexus.europlan.ru/repository/maven-jitpack/") }
    }
    dependencies {
        classpath(libs.mokoResourcesGeneratorGradle)
        classpath(libs.mokoNetworkGeneratorGradle)
        classpath(libs.kotlinSerializationGradle)
        classpath(libs.realmGradle)
        classpath(libs.gradleplugin.android)
        classpath(libs.gradleplugin.kotlin)
    }
}
