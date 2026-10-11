// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "CoReader",
    platforms: [.macOS(.v14)],
    products: [
        .library(name: "CoReaderEngine", targets: ["CoReaderEngine"]),
    ],
    targets: [
        .target(
            name: "CoReaderEngine",
            linkerSettings: [.linkedLibrary("xml2")]
        ),
        .executableTarget(name: "coreader", dependencies: ["CoReaderEngine"]),
        .executableTarget(name: "webref"),
    ]
)
