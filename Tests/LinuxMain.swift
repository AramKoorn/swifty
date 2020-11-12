import XCTest
import swiftyTests

var tests = [XCTestCaseEntry]()
tests += [testCase(TestFrame.allTests)]
tests += [testCase(TestTools.allTests)]
tests += [testCase(TestSeries.allTests)]
XCTMain(tests)
