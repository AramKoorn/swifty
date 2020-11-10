import Path
import Foundation

/// Returns the content of the csv in a string format
    ///   - Parameters:
    ///   - loc: location of the csv file  
// public func readCSV(loc: String) {
public func readCSVContent(loc: String) -> String {
    do {
       let fullPath = Path.cwd/loc
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
/// Converts everything to String
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

    for c in 0..<n_cols {
        var tmp = Array<Any> ()
        // skip the first row
        for r in 1..<n_rows {  
            tmp.append(result[r][c])
        } 
        dat.append(tmp)
    }

    // Check if we can cast the string arrays to int or doubles
    var newdat = [[Any]]()


    // Create the DataFrame
    var df = DataFrame(data: dat, columns: col)

    return df
}

// Write DataFrame to CSV file
extension DataFrame {
  public func writeCSV(loc: String) {


          let p = Path.cwd/loc
 do {    // var csvString = "column1, columns2 \n val1, val2"
          var csvString = self.columns!.joined(separator: ",") + "\n"

          // build the csv string
          // loop over roops and then colulms comlexity O(n^2)
          let rows = self.shape().0

          for row in Array(0..<rows) {

            var tmp = [String]()

            for col in self.columns! {

              if hashTypes[col]! == "Int" {

                  tmp.append(String(hashInt[col]!.values[row]))
              }

              if hashTypes[col]! == "Double" {

                  tmp.append(String(hashDouble[col]!.values[row]))
              }
              
              if hashTypes[col]! == "String" {
                  tmp.append(String(hashString[col]!.values[row]))

              }

            }
            csvString += tmp.joined(separator: ",") + "\n"

          }
          
            try csvString.write(to: p, atomically: true, encoding: .utf8)
        } catch {
            print("error creating file")
        }
  }
}
