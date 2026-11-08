plugins {
    id("com.android.application")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.privateagent.private_agent"
    compileSdk = flutter.compileSdkVersion
    // Required at build time by the transitive `jni` plugin used by
    // shared_preferences_android / path_provider_android (CMake + NDK).
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
        // Required by flutter_local_notifications (java.time APIs on older devices).
        isCoreLibraryDesugaringEnabled = true
    }

    defaultConfig {
        // Application ID (matches the namespace above and the native package).
        applicationId = "com.privateagent.private_agent"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        // minSdk 26: foreground-service types, gesture APIs and notification channels
        // all behave consistently from Android 8.0 upwards.
        minSdk = 26
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // Signed with the debug keys so `flutter run --release` works locally.
            // Replace with a private keystore before distributing.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}

dependencies {
    // Required by flutter_local_notifications for java.time support below API 26+.
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}
