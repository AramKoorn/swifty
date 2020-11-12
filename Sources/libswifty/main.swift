import Foundation
import swifty

import Foundation
import Path


print(Path.home)
print(Path.cwd)

//readCSV(loc: "projects/swift/swifty/Sources/swifty/data/testData.csv")

// // Init a DataFrame
// var df = DataFrame(data: [["hoi", "hoi", "hoi"], ["3", "4", "5"]], columns: ["hoi", "poep"], index: [0, 1, 5])
// df[["newcol1"]] = df[["hoi"]]  // test if subsripting works

// // test if reading of CSV files works
var loc = "Tests/swiftyTests/TestData/testData.csv"
var hoi = readCSV(loc: loc)
print(hoi)


// // Test if query works
// df = DataFrame(data: [["hoi", "hoi", "hoi"], ["3", "4", "5"]], columns: ["hoi", "poep"], index: [0, 1, 5])
// df.query(column: "poep", values: ["3"])

// Test the new dataframe structure 
var df1 = DataFrame(data: [[1, 2, 3], ["1", "2", "3"], [1.1, 2.2, 3.3],
                    [4, 6, 7]], columns: ["col1", "col2", "col3", "col4"])
print(df1.shape())

// df1.rename(mapper: ["col1": "renamedCol1"])
// df1.rename(mapper: ["col2": "foo"])
// print(df1.columns!)
// print(df1.hashTypes)
// print("COmplete dataframe: ")
// print(df1.values)
// print(df1.columns)
// print("df2:   " )
// print(df2)
// print(df1.shape())
// print(df1.hashInt["col4"]!.values)
// let arr = ["Hello","Bye","Halo"]
// let filtered = arr.filter { $0.contains("lo") }
// print(filtered)


// var x = ["el1", "el2", "el3", "col1", "col2"]
// print(x.filter {$0.contains("el")})

// print(df1[["col3", "col4"]])

if df1 is String{
  print("Object is DataFrame")
        }
  else {
    print("This does not work!")
}

var dfNew = df1[["col4"]]
print("----------------")
print(dfNew)

df1[["newCol"]] = df1[["col4"]]

print(df1.columns!)

df1.replace(column: "col2", mapper: ["2": "foo"])
print(df1)

var df = DataFrame(data: [[1, 2, 3], [4, 5, 6]], columns: ["col1", "col2"])
df[["newCol"]] = df[["col2"]]
print("----------------")
print(df)