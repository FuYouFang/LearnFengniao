//
//  StringsSearchRule.swift
//  LearnFengniao
//
//  Created by fuyoufang on 2017/3/27.
//
//

import Foundation

protocol StringSearcher {
    func search(in content: String) -> Set<String>
}

protocol RegexStringSearcher: StringSearcher {
    var patterns: [String] { get }
}

extension RegexStringSearcher {
    func search(in content: String) -> Set<String> {
        
        var result = Set<String>()
        for pattern in patterns {
            guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
                print("Failed to create regular expression: \(pattern)")
                continue
            }
            
            let matches = regex.matches(in: content, options: [], range: content.fullRange)
            for checkingResult in matches {
                let range = checkingResult.rangeAt(1)
                // 正则表达式获取到的 range 和 String 的 range 不匹配
                // 需要将 String 转换成 NSString
                let extracted = NSString(string: content).substring(with: range)
                
                result.insert(extracted.plainName)
            }
        }
        return result
        
    }
}

