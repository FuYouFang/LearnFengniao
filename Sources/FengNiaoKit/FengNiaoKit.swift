import Foundation
import PathKit
import Rainbow

enum FileType {
    case swift
    case objc
    case xib
    
    init?(ext: String) {
        switch ext.lowercased() {
        case "swift": self = .swift
        case "mm", "m": self = .objc
        case "xib", "storyboard": self = .xib
        default: return nil
        }
    }
        
    func searcher(extensions: [String]) -> StringSearcher {
        switch self {
        case .swift: return SwiftSearcher(extensions: extensions)
        case .objc: return ObjeCSearcher(extensions: extensions)
        case .xib: return XibSearcher(extensions: extensions)
            
        }
    }
}


public struct FileInfo {
    let path: String
}

public struct FengNiao {
    let projectPath: Path
    let excludedPaths: [Path]
    let resourceExtensions: [String]
    let fileExtensions: [String]
    
    public init(projectPath: String, excludedPaths: [String], resourceExtensions:[String], fileExtensions:[String]) {
        let path = Path(projectPath).absolute()
        self.projectPath = path
        self.excludedPaths = excludedPaths.map { path + Path($0) }
        self.resourceExtensions = resourceExtensions
        self.fileExtensions = fileExtensions
    }
    
    public func unusedResource() -> [FileInfo] {
        fatalError()
    }
    
    func allStringsInUse() -> Set<String> {
        return stringsInUse(at: projectPath)
    }
    
    func stringsInUse(at path: Path) -> Set<String> {
        guard let subPaths = try? path.children() else {
            print("Path reading error. \(path).".red)
            // 因为返回类型为 Set<String>, 此处会推断为 Set 类型
            return []
        }
        var result = [String]()
        
        for subPath in subPaths {
            if subPath.lastComponent.hasPrefix(".") {
                continue
            }
            
            if excludedPaths.contains(subPath) {
                continue
                
            }
            
            if subPath.isDirectory {
                result.append(contentsOf: stringsInUse(at: subPath))
            } else {
                let fileExt = subPath.extension ?? ""
                guard fileExtensions.contains(fileExt) else {
                    continue
                }
                
                let searcher: StringSearcher
                if let fileType = FileType(ext: fileExt) {
                    searcher = fileType.searcher(extensions: fileExtensions)
                } else {
                    searcher = GeneralSearcher(extensions: fileExtensions)
                }
                
                // read() 返回的可能是字符串，也可能是 data，
                // 但是因为 ?? ""，导致结果自动推断为字符串
                let content = (try? subPath.read()) ?? ""
                result.append(contentsOf: searcher.search(in: content))
            }
        }
        
        return Set(result)
    }
    
    func resourcesInUse() -> [String: String] {
        fatalError()
    }
    
    public func delete() -> () {
        
    }
}
