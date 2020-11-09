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
    // Get columns from the hashtable and get the values
    return DataFrame(data: tmpData,  columns: columns, index: self.index)
  }

  set {

    // Scenario 1 df[["newCOl"]] = df[["col"]]
    // In this case just merge the hashtables together

    var t = 1
    var x = 3
     
    }
  }
}
