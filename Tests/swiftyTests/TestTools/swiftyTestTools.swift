import XCTest
import swifty
import Path

public class TestTools:  XCTestCase {
    public static var allTests = [
        ("testReadCSV", testReadCSV),
        ("testWriteCSV", testWriteCSV),
    ]
  
    // test if the column names are correct
    public func testReadCSV() {
      let loc = "Tests/swiftyTests/TestData/testData.csv"
      let df = readCSV(loc: loc)
      XCTAssertEqual(df.columns!,  ["col1", "col2"])
      print(df.hashString["col1"])
      XCTAssertEqual(df.hashString["col1"]!.values, ["1", "2", "3"])
      XCTAssertEqual(df.hashString["col2"]!.values, ["foo", "bar", "baz"])
    } 
    // test if the column names are correct
    public func testWriteCSV() {
      let loc = "Tests/swiftyTests/TestData/testWriteData.csv"
      let df = DataFrame(data: [[1, 2, 3], [2, 3, 4]], columns: ["col1", "col2"])
      df.writeCSV(loc: loc)
      var path = Path.cwd/loc
      try! path.delete()
    } 
}

