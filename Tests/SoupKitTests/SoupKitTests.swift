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

    static var allTests = [
        ("testExample", testExample),
    ]
}
