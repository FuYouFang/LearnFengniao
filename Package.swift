import PackageDescription

// package 的具体写法
// https://github.com/apple/swift-package-manager

// 输入法
// http://rime.im/

// 进阶书籍
// https://www.objccn.io/products/

// 转场动画
// https://github.com/lkzhao/Hero

// block 写法
// http://fuckingblocksyntax.com/

// swift 编译时间
// http://irace.me/swift-profiling

// RxSwift
// https://github.com/ReactiveX/RxSwift

let package = Package(
    name: "LearnFengniao",
    
    // targets
    targets: [
        Target(name: "FengNiaoKit", dependencies: []),
        Target(name: "FengNiao", dependencies: ["FengNiaoKit"])
    ],
    
    // 添加依赖
    // pre 的版本只能制定具体的版本
    // majorVersion: 所有 2 的版本
    // minorVersion: 最小的版本
    dependencies: [
        .Package(url: "https://github.com/jatoben/CommandLine", "3.0.0-pre1"), // pre
        .Package(url: "https://github.com/onevcat/Rainbow", majorVersion: 2),
        .Package(url: "https://github.com/kylef/PathKit", majorVersion: 0, minor: 8)
        //.Package(url: "https://github.com/onevcat/Rainbow", minorVersion: 1)
    ]
)
