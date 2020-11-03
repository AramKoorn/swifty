import Path
import Foundation

/// Returns the content of the csv in a string format
    ///   - Parameters:
    ///   - loc: location of the csv file  
// public func readCSV(loc: String) {
public func readCSVContent(loc: String) -> String {
    do {
       let fullPath = Path.home/loc
       let content = try String(contentsOf: fullPath)
         return content
    }
    catch let error as NSError {
    print("File not found!: \(error)")
    let content = ""
      return content
    }
}


/// Returns csv content to a swifty DataFrame
    ///   - Parameters:
    ///   - loc: location of the csv file
/// note: Assumes the headers start at the first row 
/// note: can also not deal with empty cells
// public func readCSV(loc: String) {
public func readCSV(loc: String) -> DataFrame {

    // Get the content
    let data = readCSVContent(loc: loc)
    var result: [[String]] = []
    let rows = data.components(separatedBy: "\n")
    for row in rows {
        let columns = row.components(separatedBy: ",")
        result.append(columns)
    }

    // Assume that colums are the first row
    let col = result[0]

    // Remove the last array (is empty)
    result.popLast()

    let n_cols = result[0].count
    let n_rows = result.count

    var dat = [[Any]]()

    for c in 0..<n_cols{
        var tmp = Array<Any> ()
        // skip the first row
        for r in 1..<n_rows {  
            tmp.append(result[r][c])
        } 
        dat.append(tmp)
    }

    // Create the DataFrame
    var df = DataFrame(data: dat, columns: col)

    return df
}
