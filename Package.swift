// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BloodbathSwift",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "BloodbathSwift",
            targets: ["BloodbathSwift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.0.0")
    ],
    targets: [
        .target(
            name: "BloodbathSwift",
            dependencies: ["Alamofire"]),
        .testTarget(
            name: "BloodbathSwiftTests",
            dependencies: ["BloodbathSwift"]),
    ]
)

