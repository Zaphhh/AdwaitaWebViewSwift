// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdwaitaWebViewSwift",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "WebView", targets: ["WebView"]),
        .library(name: "CWebView", targets: ["CWebView"]),
    ],
    dependencies: [
        .package(url: "https://github.com/AparokshaUI/Adwaita", branch: "main"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.

        .target(name: "WebView",
            dependencies: [
                .product(name: "Adwaita", package: "Adwaita"),
                "CWebView"
            ]),
        .systemLibrary(name: "CWebView",
            pkgConfig: "webkitgtk-6.0"),
        .executableTarget(
            name: "Test",
            dependencies: ["WebView", "Adwaita"],
            path: "Tests")
    ]
)
