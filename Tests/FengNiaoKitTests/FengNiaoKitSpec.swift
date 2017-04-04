//
//  FengNiaoKitSpec.swift
//  LearnFengniao
//
//  Created by fuyoufang on 2017/3/31.
//
//

// spec 还是需要 XCTest 来启动

import Foundation
import Spectre
@testable import FengNiaoKit
import PathKit

// 测试实例
public func specFengNiaoKit() {

    describe("FengNiaoKit") { // 开启上下文

        let fixtures = Path(#file).parent().parent() + "Fixtures";
        
        $0.before { // 影响格式化输出
            
        }
        
        $0.after {
            
        }
        
        $0.describe("String Extension") { // 开启上下文
            
            $0.before {
                
            }
            
            $0.after {
                
            }
            
            $0.it("should return plain name") {
                let s1 = "image@2x.tmp"
                let s2 = "/use/local/bin/find"
                let s3 = "image@3X.png"
                let s4 = "local.host"
                let s5 = "local.host.png"
                
                let exts = ["png"]
                try expect(s1.plainName(extensions: exts)) == "image@2x.tmp"
                try expect(s2.plainName(extensions: exts)) == "find"
                try expect(s3.plainName(extensions: exts)) == "image"
                try expect(s4.plainName(extensions: exts)) == "local.host"
                try expect(s5.plainName(extensions: exts)) == "local.host"
            }
        }
        
        $0.describe("String Searchers") {
            $0.it("Swift Searcher works") {
                let s1 = "UIImage(named: \"my_image\")"
                let s2 = "sdfjs \"aa\"aingi \"_image\")"
                let s3 = "let name = \"close_button@2x\"/nlet image = UIImage(named: name)"
                let s4 = "test string: \"local.png\""
                let s5 = "test string: \"local.host\""
                
                let searcher = SwiftSearcher(extensions: ["png"])
                let result = [s1, s2, s3, s4, s5].map{ searcher.search(in: $0) }
                
                try expect(result[0]) == Set(["my_image"])
                try expect(result[1]) == Set(["aa", "_image"])
                try expect(result[2]) == Set(["close_button"])
                try expect(result[3]) == Set(["local"])
                try expect(result[4]) == Set(["local.host"])
                
            }
        }
        
        $0.describe("FengNiao") {
            $0.it("should find used strings in Swift") {
                // 获取当前运行的路径
                // 1.用 FileManager
                // 用命令行运行时为 当前的文件路径
                // 用 XCode 运行的时候，为一个临时目录
                //print(FileManager.default.currentDirectoryPath)
                // 2.用下面的方式
                //#file ,#line, #func
                
                let path = fixtures + "StringSearcher"
                let fengniao = FengNiao(projectPath: path.string, excludedPaths: [], resourceExtensions: ["png", "jpg"], fileExtensions: ["swift"])
                let result = fengniao.allStringsInUse();
                
                // 判断 result 和 预期是否相同
                let expectResult: Set<String> = Set(["my_picname"])
                try expect(result) == expectResult
                
            }
        }
    }
    
}

