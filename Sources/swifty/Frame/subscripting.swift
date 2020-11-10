extension DataFrame {
public subscript(columns: Array<String>) -> DataFrame {
  get {
   
    // Columns to get
    var tmpData = Array<Array<Any>>()
    
    for (col) in columns{
  
      if hashTypes[col] == "Int" {
        tmpData.append(hashInt[col]!.values)
      }
      if hashTypes[col] == "Double" {
        tmpData.append(hashDouble[col]!.values)
      }
      if hashTypes[col] == "String" {
        tmpData.append(hashString[col]!.values)
      }
    }
    print(columns)
    // Get columns from the hashtable and get the values
    return DataFrame(data: tmpData,  columns: columns, index: self.index)
  }

  set {

    // Scenario 1 df[["newCOl"]] = df[["col"]]
    if (newValue is DataFrame) {

    for (idx, col) in newValue.columns!.enumerated() {

      // Update hashtypes and hashtables with values
      if newValue.hashTypes[col] == "Int" {
        hashTypes[columns[idx]] = "Int"
        hashInt[columns[idx]] = newValue.hashInt[col]

      }
      if newValue.hashTypes[col] == "Double" {
        hashTypes[columns[idx]] = "Double"
        hashDouble[columns[idx]] = newValue.hashDouble[col]
      }
      if newValue.hashTypes[col] == "String" {
        hashTypes[columns[idx]] = "String"
        hashString[columns[idx]] = newValue.hashString[col]
      }

    }
     
    // Update the colums
    var newCol = self.columns! + columns
    newCol = newCol.uniqued()
    self.columns = newCol

    // Update data
    updateData()

    }

    }
  }
}
