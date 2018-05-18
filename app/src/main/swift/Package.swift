// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "swiftandroid",
    products: [
        .library(name: "swiftandroid", type: .dynamic, targets: ["swiftandroid"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftJava/java_swift.git", "2.1.1"..<"3.0.0"),
    ],
    targets: [
        .target(
            name: "swiftandroid",
            dependencies: ["java_swift"],
            path: "Sources"
        ),
    ]
)