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


// 测试 XCTestCase
// 命令行：swift test
// 快捷键：commond + U

// BDD 行为驱动开发（英语：Behavior-driven development）
// TDD 测试驱动开发

//
// @testable import 测试时需要调用 非 public 的东西时，需要用这个导入

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
        .Package(url: "https://github.com/kylef/PathKit", majorVersion: 0, minor: 8),
        // 只是 test 项目需要，目前只能写在这里
        .Package(url: "https://github.com/kylef/Spectre.git", majorVersion: 0, minor: 7),
        
    ],
    
    // 添加一个文件之后，会尝试创建一个 module
    // 会报下面的错误
    // error: the module at Tests/Fixtures has an invalid name ('Fixtures'): the name of a test module has no ‘Tests’ suffix
    // fix: rename the module at ‘Tests/Fixtures’ to have a ‘Tests’ suffix
    // 需要排除掉不需要处理的文件夹
    exclude : [
        "Tests/Fixtures"
    ]
)
