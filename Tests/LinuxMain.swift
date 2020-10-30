import XCTest

import swiftyTests

var tests = [XCTestCaseEntry]()
tests += swiftyTests.allTests()
//tests += TestOne.allTests()
XCTMain(tests)
