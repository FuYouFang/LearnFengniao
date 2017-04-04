import XCTest
// 
@testable import FengNiaoKit


// XCT 的类名要以 Tests 结尾
// 里面的方法要以 test 开头
// 判读结果： XCTAssertEqual

// 异步
// 

class FengNiaoKitTests : XCTestCase {
    
    func testFengNiaoKitSpecs() {
        specFengNiaoKit()
    }
    
//    func testFirstCase() {
//        let a = 1 + 2
//        XCTAssertEqual(a , 3, "1 + 2 = 3")
//    }
//    
//    func testStringPlainNameExtension() {
//        let s1 = "image@2x.png"
//        let s2 = "/use/local/bin/find"
//        
//        XCTAssertEqual(s1.plainName, "image")
//        XCTAssertEqual(s2.plainName, "find")
//    }
}
