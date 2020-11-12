public struct DataFrame{
    
    // Initializers
    public var data: Array<Array<Any>>?
    public var columns: [String]? // columns can be int, double or string
    public var index: [Int]?
    
    // Hashtables --> Keys are the columns
    public var hashInt = Dictionary<String, Series<Int>>()
    public var hashDouble = Dictionary<String, Series<Double>>()
    public var hashString = Dictionary<String, Series<String>>()
    
    // Hashtable for the types
    public var hashTypes = Dictionary<String, String>()

    // Initialize values
    public var values = [Any]()

    public init(data: Array<Array<Any>>? = nil, columns: [String]? = nil, index: [Int]? = nil) {
        self.data = data
        self.columns = columns
        self.index = index

        // Init index if not specified as argument
        if (self.index == nil && self.data != nil) {    
            let row = self.data![0] as! Array<Any>
            self.index = Array(0 ..< row.count) // int by default
        }

        if (self.columns == nil && self.data != nil) {
            self.columns = Array(0 ..< self.data!.count).map { String($0) }
        }

        if (self.data != nil) {

            // Cast each array to Series with correct type
            var i = 0
            data!.forEach {
            guard !$0.isEmpty else { return }
            switch $0.first {
            case _ as Int:
                var series = handleIntArray($0 as! [Int])
                hashInt[self.columns![i]] = series
                hashTypes[self.columns![i]] = "Int"
                values.append(series)
                i += 1
            case _ as Double:
                var series = handleDoubleArray($0 as! [Double])
                hashDouble[self.columns![i]] = series
                hashTypes[self.columns![i]] = "Double"
                values.append(series)
                i += 1
            case _ as String:
                var series = handleStringArray($0 as! [String])
                hashString[self.columns![i]] = series
                hashTypes[self.columns![i]] = "String"
                values.append(series)
                i += 1
            default:
                print("Unsupported type")
        }
            }
                }

        // Cast to Series Int
        func handleIntArray(_ array: [Int]) -> Series<Int>{
            return Series(values: array)
        }
        
        // Cast to Series Double
        func handleDoubleArray(_ array: [Double]) -> Series<Double> {
            return Series(values: array)
        }

        // Cast to string 
        func handleStringArray(_ array: [String]) -> Series<String> {
            return Series(values: array)
        }   
        
    }    
}

extension DataFrame {
    mutating func updateData() {

        var newData = [Any]()
        var data = [[Any]]()
        //newData = Array<Array<Any>>?

        for col in self.columns! {

            if hashTypes[col]! == "Int" {

                newData.append(hashInt[col]!)
                data.append(hashInt[col]!.values)
            }

            if hashTypes[col]! == "Double" {

                newData.append(hashDouble[col]!)
                data.append(hashDouble[col]!.values)
            }
            
            if hashTypes[col]! == "String" {

                newData.append(hashString[col]!)
                data.append(hashString[col]!.values)
            }
        }

        // Update values
        self.data! = data
        self.values = newData

  }
}


extension DataFrame { 
  // The assumption is that self.index has already been updated
  mutating func updateDataOnIndex() {

    for col in self.columns! {


            if hashTypes[col]! == "Int" {
              
              hashInt[col]!.values = self.index!.map { hashInt[col]!.values[$0] }

            }

            if hashTypes[col]! == "Double" {
              hashDouble[col]!.values = self.index!.map { hashDouble[col]!.values[$0] }
            }
            
            if hashTypes[col]! == "String" {
              hashString[col]!.values = self.index!.map { hashString[col]!.values[$0] }
            }

    } 

  // Update the data
  updateData() 

  }
}

// Rename columns
extension DataFrame {

    mutating public func rename(mapper: Dictionary<String, String>) {

        for (k, v) in mapper {

            // overwrite the column name
            self.columns = self.columns!.map({ return $0 == k ? v : $0 })
        }

        // check which hashtables we have to update
        var tmpTypes = hashTypes.filter({  Array(mapper.keys).contains($0.key) }) 

        // Loop over tmpTypes and get the correct hashtable and update 
        // probably want to use enum switch case for this
        for (col, t) in tmpTypes {
            
            if t == "Int" {

                switchKey(&hashInt, fromKey: col, toKey: mapper[col]!)
            }

            if t == "Double" {

                switchKey(&hashDouble, fromKey: col, toKey: mapper[col]!)
            }

            if t == "String" {

                switchKey(&hashString, fromKey: col, toKey: mapper[col]!)
            }
            
            // Finally update the key from the hashTypes
            switchKey(&hashTypes, fromKey: col, toKey: mapper[col]!)

        }

        // Update the data
        updateData()

    }
}


extension DataFrame {
    public func shape() -> (Int, Int) {

        // Take arbitrary column
        var tmpCol = self.columns![0]
        var tmpType = hashTypes[tmpCol]!
        var rows = -1  // Init with -1 value
        
        
        if tmpType == "Int" {
            rows = hashInt[tmpCol]!.values.count
        }
        if tmpType == "Double" {
            rows = hashDouble[tmpCol]!.values.count

        }
        if tmpType == "String" {
            rows = hashString[tmpCol]!.values.count
        }

        //  (self.values[0].count, self.values.count)
        return (rows, self.data!.count)
        }
}

// Drop columns
extension DataFrame {
  mutating public func drop(columns: [String]) {

    // drop the columns
    self.columns = self.columns!.filter( {!columns.contains($0)})  

    // check which hashtables we have to update

    for col in columns{

    if hashTypes[col] == "Int" {
      hashInt = hashInt.filter({  !Array(columns).contains($0.key) }) 
      }
    if hashTypes[col] == "Double" {
      hashDouble = hashDouble.filter({  !Array(columns).contains($0.key) }) 
      }
    if hashTypes[col] == "String" {
      hashString = hashString.filter({  !Array(columns).contains($0.key) }) 
      }
    }

    // Update data
    updateData()
  }
} 


// Filter columns
extension DataFrame {
  mutating public func filter(pattern: String) {
    // Filter on pattern and select the columns and then update the hashtables
     self.columns = self.columns!.filter {$0.contains(pattern)}

    // check which hashtables we have to update
    var tmpTypes = hashTypes.filter({  Array(self.columns!).contains($0.key) }) 

    for (col, val) in tmpTypes {
  
      if val == "Int" {
        hashInt = hashInt.filter({  Array(self.columns!).contains($0.key) }) 
      }
      if val == "Double" {
        hashDouble = hashDouble.filter({  Array(self.columns!).contains($0.key) }) 
      }
      if val == "String" {
        hashString = hashString.filter({  Array(self.columns!).contains($0.key) }) 
      }
    
    }
    // Update data
    updateData()
  }
}


extension DataFrame {
  // For now we can only merge on the rows later add option to concat on columns
  mutating public func concat(data: [DataFrame], axis: String = "rows") {
    for frame in data {
      // check if Nr rows are the same for both dataframes
      
      // Merge the hash tables
      frame.hashTypes.forEach { (key, value) in self.hashTypes[key] = value }
      frame.hashInt.forEach { (key, value) in self.hashInt[key] = value }
      frame.hashDouble.forEach { (key, value) in self.hashDouble[key] = value }
      frame.hashString.forEach { (key, value) in self.hashString[key] = value }

      // update columns
      self.columns! += frame.columns!
    }
  }
}

extension DataFrame {
  mutating public func replace(column: String, mapper: Dictionary<AnyHashable, Any>) {
    
            if hashTypes[column]! == "Int" {
              
              // cast mapping to correct type 
              let map = mapper as! [Int:Int] 
              for (k, v) in map {
                hashInt[column]!.values = hashInt[column]!.values.map({ return $0 == k ? v : $0 }) 
              }

                
            }

            if hashTypes[column]! == "Double" {

              // cast mapping to correct type 
              let map = mapper as! [Double:Double] 
              for (k, v) in map {
                hashDouble[column]!.values = hashDouble[column]!.values.map(
                  { return $0 == k ? v : $0 }) 
              }
            }
            
            if hashTypes[column]! == "String" {
              
              // cast mapping to correct type 
              let map = mapper as! [String:String] 
              for (k, v) in map {
                hashString[column]!.values = hashString[column]!.values.map(
                  { return $0 == k ? v : $0 }) 
              }
            }

            // Update data
            updateData()
  }
}
