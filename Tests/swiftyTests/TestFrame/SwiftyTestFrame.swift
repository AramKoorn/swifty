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
        ("testDropMultipleColumn", testDropMultipleColumn),
        ("testGetSubscripting", testGetSubscripting),
        ("testSetSubscripting", testSetSubscripting),
        ("testConcat", testConcat),
        ("testQuery", testQuery),
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
    // Test if dropping of column
    public func testDropMultipleColumn() {
        var df = DataFrame(data: [[1, 2, 3], ["2", "2", "foo"], [1, 2, 3]],
                           columns: ["col1", "col2", "col2test"])
        df.drop(columns: ["col2"])
        XCTAssertEqual(df.columns!,  ["col1", "col2test"])
    }
    // Test if filter on pattern matching works 
    public func testFilterDataFrame() {
        var df = DataFrame(data: [[1], [2], [3], [1]],
                           columns: ["col1", "col2", "el1", "el2"] )
        df.filter(pattern: "el")
        XCTAssertEqual(df.columns!,  ["el1", "el2"])
    }
    // Test if subscripting returns the correct dataframe 
    public func testGetSubscripting() {
        var df = DataFrame(data: [[1], [2], [3], [4]],
                           columns: ["col1", "col2", "el1", "el2"] )
        var newDF = df[["col1", "el2"]]
        XCTAssertEqual(newDF.columns!,  ["col1", "el2"])
        XCTAssertEqual(newDF.hashInt["col1"]!.values, [1])
        XCTAssertEqual(newDF.hashInt["el2"]!.values, [4])
        XCTAssertEqual(Array(newDF.hashString.keys), [])
    }
    public func testSetSubscripting() {
        var df = DataFrame(data: [[1], [2], [3], [1]],
                           columns: ["col1", "col2", "el1", "el2"] )
        df[["newCol"]] = df[["el2"]]
        XCTAssertEqual(df.columns!, ["col1", "col2", "el1", "el2", "newCol"])
        XCTAssertEqual(df.hashInt["newCol"]!.values, [1])
    }
    public func testConcat() {
        var df1 = DataFrame(data: [[1], [2]], columns: ["col1", "col2"] )
        var df2 = DataFrame(data: [["foo"], ["bar"]], columns: ["col3", "col4"] )
        df1.concat(data: [df2])
        print(df1.columns)
        XCTAssertEqual(df1.columns!, ["col1", "col2", "col3", "col4"])
    }
    public func testQuery() {
        var df = DataFrame(data: [[1, 2, 3], [2, 2, 5], ["foo", "bar","baz"]],
                            columns: ["col1", "col2", "col3"])
        df.query(column: "col3", values: ["bar", "baz"])
        XCTAssertEqual(df.columns!, ["col1", "col2", "col3"])
        XCTAssertEqual(df.hashInt["col1"]!.values, [2, 3])
        XCTAssertEqual(df.hashString["col3"]!.values, ["bar","baz"])
        XCTAssertEqual(df.index!, [1, 2])
    }
}

