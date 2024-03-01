plugins {
    kotlin("jvm").version(libs.versions.kotlin)
    kotlin("plugin.serialization").version(libs.versions.kotlin)
    application
}

group = "dev.mattsturgeon"
version = "1.0-SNAPSHOT"

application {
    mainClass = "dev.mattsturgeon.MainKt"
}

repositories {
    mavenCentral()
}

dependencies {
    implementation(libs.clikt)
    implementation(libs.json)
    implementation(libs.jgit)
    implementation(libs.github)
    testImplementation(libs.ktest)
}

tasks.test {
    useJUnitPlatform()
}

tasks.wrapper {
    gradleVersion = "8.5"
    distributionType = Wrapper.DistributionType.ALL
}

kotlin {
    val version = libs.versions.jvm.map(String::toInt)
    jvmToolchain(version.get())
}
