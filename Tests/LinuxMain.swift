import XCTest
import swiftyTests

var tests = [XCTestCaseEntry]()
tests += swiftyTests.allTests()
tests += [testCase(TestFrame.allTests)]
tests += [testCase(TestTools.allTests)]
tests += [testCase(TestSeries.allTests)]
XCTMain(tests)
