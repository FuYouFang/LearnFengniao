import PackageDescription

// package 的具体写法
// https://github.com/apple/swift-package-manager

let package = Package(
    name: "LearnFengniao",
    
    // 添加依赖
    // pre 的版本只能制定具体的版本
    // majorVersion: 所有 2 的版本
    // minorVersion: 最小的版本
    dependencies: [
        .Package(url: "https://github.com/jatoben/CommandLine", "3.0.0-pre1"), // pre
        .Package(url: "https://github.com/onevcat/Rainbow", majorVersion: 2),
        //.Package(url: "https://github.com/onevcat/Rainbow", minorVersion: 1)
    ]
)
