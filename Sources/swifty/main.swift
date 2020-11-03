import Foundation
import Path
print("Hello, world!")


//readCSV(loc: "projects/swift/swifty/Sources/swifty/data/testData.csv")

var col1 = ["col1", "col2"]
var col2 = ["sdf", "sfff"]

var loc = "projects/swift/swifty/Sources/swifty/data/testData.csv"
var hoi = readCSVContent(loc: loc)
var sj = readCSV(loc: loc)
let bashProfile = try String(contentsOf: Path.home/loc)
print(bashProfile)

// public func readCSV(loc: String) {

//     do {
//        let fullPath = Path.home/loc
//        let content = try String(contentsOf: fullPath)
//        print("SIDOFHJKJLSHDJFKLSHDFKJLHLKJSDFHKJLSDHFKJLSHDFKLJSDFH")
//        print(content)
//             }
//     catch let error as NSError {
//     print("Ooops! Something went wrong: \(error)")
//     }
    
// }

var x = DataFrame(data: [["1", "2", "3"], ["3", "4", "5"]])
var df = DataFrame(data: [["1", "2", "3"], ["3", "4", "5"]], columns: ["hoi", "poep"], index: [0, 1, 5])


let file = "test_data.csv" //this is the file. we will write to and read from it

let text = "some text" //just a text

let fileManager = FileManager.default


print("The current working directory is: ")
print(FileManager.default.currentDirectoryPath)

var path = fileManager.currentDirectoryPath
path = path.appendingPathComponent(file)
print(path)

// Read data from this file.
//let path = "/Users/samallen/file.txt"



// catch let error as NSError {
//     print("Ooops! Something went wrong: \(error)")
// }

do {
    // Get the contents
    let contents = try String(contentsOfFile: "hoi.csv", encoding: .utf8)
    print(contents)
}
catch let error as NSError {
    print("Ooops! Something went wrong: \(error)")
}

//let text2 = try String(contentsOf:path, encoding: .utf8)

// if let dir = fileManager.currentDirectoryPath {

//     let fileURL = dir.appendingPathComponent(file)

//     //writing
//     do {
//         try text.write(to: fileURL, atomically: false, encoding: .utf8)
//     }
//     catch {/* error handling here */}

//     //reading
//     do {
//         let text2 = try String(contentsOf: fileURL, encoding: .utf8)
//     }
//     catch {/* error handling here */}
// }
