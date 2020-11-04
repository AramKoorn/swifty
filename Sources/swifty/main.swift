import Foundation
import Path
print("Hello, world!")


//readCSV(loc: "projects/swift/swifty/Sources/swifty/data/testData.csv")

var col1 = ["col1", "col2"]
var col2 = ["sdf", "sfff"]

// var loc = "projects/swift/swifty/Sources/swifty/data/testData.csv"
// var hoi = readCSVContent(loc: loc)
// var sj = readCSV(loc: loc)
// let bashProfile = try String(contentsOf: Path.home/loc)
// print(bashProfile)

// var x = DataFrame(data: [["1", "2", "3"], ["3", "4", "5"]])
var df = DataFrame(data: [["hoi", "hoi", "hoi"], ["3", "4", "5"]], columns: ["hoi", "poep"], index: [0, 1, 5])
//print(df[["hoi"]])
//df.printHashtable()
// print(df[["hoi"]])
//df[["new"]] = ["1", "sdf", "3"]



//df[["newcol"]] = [1, 2, 3]
df[["newcol1"]] = df[["hoi"]]
print(df)
var df1 = DataFrame(data: [[]])
// print(df.columns)
// print(df.data)
// print(df.index)
