import XCTest
import swifty

extension swiftyTests {
    func testAdd() {
        XCTAssertEqual(1, 1)
    }   

        func testMin() {
        XCTAssertEqual(1, 1)
    }     

    static var allTests = [
        ("tesAdd", testAdd),
        ("tesHoi", testHoi),
        ("tesMin", testMin),

    ]

} 

public class TestFrame:  XCTestCase {
    public static var allTests = [
        ("testCol", testCol),
        ("testRename", testRename),
        ("testDropOneColumn", testDropOneColumn),

       //("testRename", testRename),
    ]
  
    // test if the column names are correct
    public func testCol() {
        let df = DataFrame(data: [[1, 2, 3]], columns: ["col1"])
        print(df.values)
        XCTAssertEqual(df.columns!,  ["col1"])
    }

    public func testRename() {
        var df = DataFrame(data: [[1, 2, 3], [2, 3, 4]], columns: ["col1", "col2"])
        df.rename(mapper: ["col2": "renamedCol"])
        XCTAssertEqual(df.columns!,  ["col1", "renamedCol"])
        XCTAssertEqual(df.hashInt["renamedCol"]!.values, [2, 3, 4])

    }
    // Test if dropping of columsn works 
    public func testDropOneColumn() {
        var df = DataFrame(data: [[1, 2, 3], ["2", "2", "foo"]], columns: ["col1", "col2"])
        df.drop(columns: ["col2"])
        XCTAssertEqual(df.columns!,  ["col1"])
        XCTAssertEqual(df.hashInt["col1"]!.values, [1, 2, 3])
    }
}


