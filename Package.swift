// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "ExpenseTracker",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "ExpenseTracker",
            targets: ["ExpenseTracker"]),
    ],
    dependencies: [
        .package(name: "AppCenter", url: "https://github.com/microsoft/appcenter-sdk-apple.git", .upToNextMajor(from: "5.0.0"))
    ],
    targets: [
        .target(
            name: "ExpenseTracker",
            dependencies: [
                .product(name: "AppCenterAnalytics", package: "AppCenter"),
                .product(name: "AppCenterCrashes", package: "AppCenter")
            ])
    ]
)
