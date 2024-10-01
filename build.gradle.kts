plugins {
    kotlin("multiplatform") version "1.9.0"
    id("io.ktor.plugin") version "2.3.4"
    id("org.jetbrains.kotlin.plugin.serialization") version "1.9.0"
    application
}

repositories {
    mavenCentral()
    maven { url = uri("https://maven.pkg.jetbrains.space/public/p/ktor/eap") }
}

kotlin {
    val hostOs = System.getProperty("os.name")
    val arch = System.getProperty("os.arch")
    //jvm("native")
    linuxX64("native") {
        binaries {
            executable {
                entryPoint = "main"
            }
        }
    }

    sourceSets {
        val nativeMain by getting {
            dependencies {
                implementation("io.ktor:ktor-server-core:2.3.4")
                implementation("io.ktor:ktor-server-cio:2.3.4")
            }
        }
    }
}

/*
application {
    mainClass.set("com.example.MainKt") // Замініть "com.example.MainKt" на повний шлях до вашого головного класу
}*/
