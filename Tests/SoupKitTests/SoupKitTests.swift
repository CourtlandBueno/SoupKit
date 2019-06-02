import XCTest
@testable import SoupKit

final class SoupKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let text = "Hello, World!"
        XCTAssertEqual(text, "Hello, World!")
        
    }
    
    func testCachedKnownAttributesURL() {
        let bundle = Bundle(for: InternalClass.self)
//        let url = URL(fileReferenceLiteralResourceName: "known_attributes.plist")
        
        let url = bundle.url(forResource: "known_attributes", withExtension: "plist")
        XCTAssertNotNil(url)
//        let data = try! Data.init(contentsOf: url)
//        let cache = try! KnownAttribute.load(from: data)
//        
//        XCTAssert(!cache.isEmpty)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
