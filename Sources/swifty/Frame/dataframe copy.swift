public struct DataFrame1{
    
    // Initializers
    var data: Array<Array<Any>>?
    var columns: [String]? // columns can be int, double or string
    var index: [Int]?
    
    // Hashtables --> Keys are the columns
    var hashInt = Dictionary<String, Series<Int>>()
    var hashDouble = Dictionary<String, Series<Double>>()
    var hashString = Dictionary<String, Series<String>>()
    
    // Hashtable for the types
    var hashTypes = Dictionary<String, String>()

    // Initialize values
    var values = [Any]()

    init(data: Array<Array<Any>>? = nil, columns: [String]? = nil, index: [Int]? = nil) {
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

extension DataFrame1 {
    mutating func updateData() {

        var newData = [Any]()
        //newData = Array<Array<Any>>?

        for col in self.columns! {

            print(col)
            
            if hashTypes[col]! == "Int" {

                newData.append(hashInt[col]!)
            }

            if hashTypes[col]! == "Double" {

                newData.append(hashDouble[col]!)
            }
            
            if hashTypes[col]! == "String" {

                newData.append(hashString[col]!)
            }
        }

        // Update values
        self.values = newData

        // 
        var x = 1


    }
}

// Rename columns
extension DataFrame1 {

    mutating func rename(mapper: Dictionary<String, String>) {

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

        var x = 1 

    }
}


extension DataFrame1 {
    public func shape() -> (Int, Int) {

            var x = 1

        //  (self.values[0].count, self.values.count)
        return (2, 2)

    }
}