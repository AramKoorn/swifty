extension DataFrame {
public subscript(columns: Array<String>) -> DataFrame {
  get {
   
    // Columns to get
    var tmpData = Array<Array<Any>>()
    
    // check which hashtables we have to update
    var tmpTypes = hashTypes.filter({  Array(columns).contains($0.key) }) 

    for (col, val) in tmpTypes {
  
      if val == "Int" {
        tmpData.append(hashInt[col]!.values)
      }
      if val == "Double" {
        tmpData.append(hashDouble[col]!.values)
      }
      if val == "String" {
        tmpData.append(hashString[col]!.values)
      }
    }
    // Get columns from the hashtable and get the values
    return DataFrame(data: tmpData,  columns: columns, index: self.index)
  }

  set {
     
    }
  }
}
