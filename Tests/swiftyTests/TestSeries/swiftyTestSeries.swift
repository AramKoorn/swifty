import XCTest
import swifty

public class TestSeries:  XCTestCase {
    public static var allTests = [
        ("testSum", testSum),
        ("testMean", testMean),
    ]
  
    // test Series sum
    public func testSum() {
      let series = Series(values: [1, 1, 3])
      let sm = series.sum()
      print(sm)
      XCTAssertEqual(sm, 5)
    } 
    
    // test if the column names are correct
    public func testMean() {
      let series = Series(values: [2, 3])
      let mean = series.mean()
      print(mean)
      XCTAssertEqual(mean, 2.5)
    } 
}
