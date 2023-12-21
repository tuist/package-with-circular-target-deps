// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "package-with-circular-target-deps",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "A",
            targets: ["A"]),
        .library(
            name: "B",
            targets: ["B"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "A",
            dependencies: ["B"]),
        .target(
            name: "B",
            dependencies: ["A"]),
        .testTarget(
            name: "ATests",
            dependencies: ["A"]),
        .testTarget(
            name: "BTests",
            dependencies: ["B"])
    ]
)
