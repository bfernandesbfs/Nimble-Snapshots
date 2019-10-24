// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Nimble-Snapshots",
    platforms: [
        .iOS(.v10), .tvOS(.v9),
    ],
    products: [
        .library(
            name: "Nimble-Snapshots",
            targets: ["Nimble-Snapshots"]),
    ],
    dependencies: [
        .package(url: "https://github.com/bfernandesbfs/ios-snapshot-test-case.git", .branch("spm")),
        .package(url: "https://github.com/Quick/Nimble.git", .exact("8.0.2")),
    ],
    targets: [
        .target(
            name: "Nimble-Snapshots",
            dependencies: ["DynamicSize", "DynamicType", "Nimble", "FBSnapshotTestCase"],
            path: "Nimble_Snapshots",
            sources: ["Core"]
        ),
        .target(
            name: "DynamicSize",
            dependencies: ["Nimble", "FBSnapshotTestCase"],
            path: "Nimble_Snapshots",
            sources: ["DynamicSize", "Tracker"]
        ),
        .target(
            name: "DynamicType",
            dependencies: ["DynamicSize", "Support", "Nimble", "FBSnapshotTestCase"],
            path: "Nimble_Snapshots",
            sources: ["DynamicType"]
        ),
        .target(
            name: "Support",
            dependencies: ["Nimble"],
            path: "Nimble_Snapshots",
            sources: ["Support"],
            publicHeadersPath: "Support"
        )
    ]
)


// s.subspec "Core" do |ss|
//   ss.source_files  = "Nimble_Snapshots/*.{h,m,swift}",
//                       "Nimble_Snapshots/DynamicType/*.{swift,m,h}",
//                       "Nimble_Snapshots/DynamicSize/*.{swift}"
//   ss.dependency "iOSSnapshotTestCase", "~> 6.0"
//   ss.dependency "Nimble", "~> 8.0"
// end
//
// # for compatibiliy reasons
// s.subspec "DynamicType" do |ss|
//   ss.dependency "Nimble-Snapshots/Core"
// end
//
// s.subspec "DynamicSize" do |ss|
//   ss.dependency "Nimble-Snapshots/Core"
// end
