import XCTest
import class Foundation.Bundle

class TestOne : XCTestCase {
  static var allTests = {
    return [
      ("test_a", test_a),
      ("test_b", test_b),
      // etc
    ]
  }()
  
  func test_a() {
    XCTAssertEqual(2+2, 4)
  }
  
  func test_b() {
    XCTAssertEqual(2*2, 4)
  }
}