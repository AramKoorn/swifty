print("Hello, world!")


var col1 = ["col1", "col2"]
var col2 = ["sdf", "sfff"]



var df = DataFrame(data: [["1", "2", "3"], ["3", "4", "5"]], columns: ["hoi", "poep"], index: [0, 1, 5])

print(df.columns)
//print(df.data)\
// var df = DataFrame(data: [1, 2, 3])
//print(df.data)
print(table: [[1, 2], [2, 3]], header: df.columns!)


print("Test subscript")

var cols = ["poep"]
print(df[cols])

//print("Index  is: " \(df.index))