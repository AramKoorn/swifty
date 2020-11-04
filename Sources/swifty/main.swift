import Foundation
import Path

//readCSV(loc: "projects/swift/swifty/Sources/swifty/data/testData.csv")

// Init a DataFrame
var df = DataFrame(data: [["hoi", "hoi", "hoi"], ["3", "4", "5"]], columns: ["hoi", "poep"], index: [0, 1, 5])
df[["newcol1"]] = df[["hoi"]]  // test if subsripting works

// test if reading of CSV files works
var loc = "projects/swift/swifty/Sources/swifty/data/testData.csv"
var hoi = readCSV(loc: loc)
print(hoi)


// Test if query works
df = DataFrame(data: [["hoi", "hoi", "hoi"], ["3", "4", "5"]], columns: ["hoi", "poep"], index: [0, 1, 5])
df.query(column: "poep", values: ["3"])