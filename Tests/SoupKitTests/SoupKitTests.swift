import XCTest
@testable import SoupKit
import Foundation
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

final class SelectorQueryCompTests: XCTestCase {
    
    private func _test(rawValue: String, expectation: SelectorQuery) {
        let comp = SelectorQuery(rawValue: rawValue)
        XCTAssertNotNil(comp)
        XCTAssert(comp?.rawValue == rawValue)
        XCTAssertEqual(comp, expectation)
    }
    
    func testTag() {
        _test(rawValue: "a", expectation: .tag("a", namespace: nil))
        _test(rawValue: "div", expectation: .tag("div", namespace: nil))
        _test(rawValue: "fb|name", expectation: .tag("name", namespace: "fb"))
    }
    
    func testAll() {
        _test(rawValue: "*", expectation: .allElements)
    }
    
    func testID() {
        _test(rawValue: "#content", expectation: .id("content"))
    }
    
    func testClass() {
        _test(rawValue: ".masthead", expectation: .classname("masthead"))
    }
    
    func testAttributeKey() {
        _test(rawValue: "[href]", expectation: .attr(.equalTo, key: "href"))
        _test(rawValue: "[^src]", expectation: .attr(.startsWith, key: "src"))
    }
    
    func testAttributeValue() {
        
        let key = "href"
        let value = "/image/abc.jpeg"
        
        _test(rawValue: "[\(key)=\(value)]", expectation: .attrKey(key, .equalTo, value: value))
        _test(rawValue: "[\(key)^=\(value)]", expectation: .attrKey(key, .startsWith, value: value))
        _test(rawValue: "[\(key)$=\(value)]", expectation: .attrKey(key, .endsWith, value: value))
        _test(rawValue: "[\(key)~=\(value)]", expectation: .attrKey(key, .matches, value: value))
        _test(rawValue: "[\(key)*=\(value)]", expectation: .attrKey(key, .contains, value: value))
        
    }
    
    static var allTests = [
        ("testTag", testTag),
        ("testAll", testAll),
        ("testID", testID),
        ("testClass", testClass),
        ("testAttributeKey", testAttributeKey),
        ("testAttributeValue", testAttributeValue),
    ]
}

final class PseudoSelectorTests: XCTestCase {
    
    private func _test(rawValue: String, expectation: PseudoSelector) {
        let ps = PseudoSelector(rawValue: rawValue)
        XCTAssertNotNil(ps)
        XCTAssert(ps?.rawValue == rawValue)
        XCTAssertEqual(ps, expectation)
    }
    
    func testSiblingIndex() {
        let idx = 14
        
        _test(rawValue: ":lt(\(idx))", expectation: .siblingIndex(.lessThan, idx))
        _test(rawValue: ":gt(\(idx))", expectation: .siblingIndex(.greaterThan, idx))
        _test(rawValue: ":eq(\(idx))", expectation: .siblingIndex(.equalTo, idx))
    }
    
    func testSelector() {
        
        let selector = "div > a[href]"
        
        _test(rawValue: ":not(\(selector))", expectation: .selector(.not, selector))
        _test(rawValue: ":has(\(selector))", expectation: .selector(.has, selector))
    }
    
    func testText() {
        let value = "swiftsoup"
        
        _test(rawValue: ":contains(\(value))", expectation: .text(.contains(own: false), value))
        _test(rawValue: ":containsOwn(\(value))", expectation: .text(.contains(own: true), value))
        _test(rawValue: ":matches(\(value))", expectation: .text(.matches(own: false), value))
        _test(rawValue: ":matchesOwn(\(value))", expectation: .text(.matches(own: true), value))
    }
    
    static var allTests = [
        ("testSiblingIndex", testSiblingIndex),
        ("testSelector", testSelector),
        ("testText", testText),
    ]
}
//
//final class SelectorComponentsTests: XCTestCase {
//
//    private func _test(rawValue: String, expectation: SelectorComponents) {
//        let input = SelectorComponents(rawValue: rawValue)
//        
//        XCTAssertNotNil(input)
//        
//        XCTAssert(input?.rawValue == rawValue)
//        
//        XCTAssertEqual(input, expectation)
//    }
//    
//    
//    
//    func testRawInit_withTag() {
//        _test(rawValue: "div", expectation: .init(head: .tag("div"), tail: nil, pseudo: nil))
//    }
//    
//    func testRawInit_withNamespacedTag() {
//
//        _test(rawValue: "fb|name", expectation: .init(head: .namespace("fb", tag: name), tail: nil, pseudo: nil))
//    }
//    
//    func testRawInit_withClass() {
//        
//        _test(rawValue: ".masthead", expectation: .init(head: nil, tail: .classname("masthead"), pseudo: nil))
//    }
//}
