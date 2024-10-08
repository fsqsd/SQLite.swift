// swift-tools-version:5.9
// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SQLiteSwift",  // 将 "SQLite.swift" 改为 "SQLiteSwift"
    platforms: [
        .iOS(.v11),
        .macOS(.v10_13),
        .watchOS(.v4),
        .tvOS(.v11),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "SQLiteSwift",  // 将 "SQLite" 改为 "SQLiteSwift"
            targets: ["SQLiteSwift"]  // 将 "SQLite" 改为 "SQLiteSwift"
        )
    ],
    targets: [
        .target(
            name: "SQLiteSwift",  // 将 "SQLite" 改为 "SQLiteSwift"
            path: "Sources/SQLite",  // 保持路径不变
            exclude: [
                "Info.plist"
            ]
        ),
        .testTarget(
            name: "SQLiteSwiftTests",  // 将 "SQLiteTests" 改为 "SQLiteSwiftTests"
            dependencies: [
                "SQLiteSwift"  // 将 "SQLite" 改为 "SQLiteSwift"
            ],
            path: "Tests/SQLiteTests",  // 保持路径不变
            exclude: [
                "Info.plist"
            ],
            resources: [
                .copy("Resources")
            ]
        )
    ]
)

#if os(Linux)
package.dependencies = [
    .package(url: "https://github.com/stephencelis/CSQLite.git", from: "0.0.3")
]
package.targets.first?.dependencies += [
    .product(name: "CSQLite", package: "CSQLite")
]
#endif
