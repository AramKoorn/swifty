public struct DataFrame {
    
    // Force columns to be strings for now
    
    var columns: Array<String>?
    var index: Array<Int>?
    var data: Array<Any>?

    // To select columns/values
    var hashTable = Dictionary<String, Any>()
    
    init( data: Array<Any>? = nil, columns: Array<String>? = nil, index: Array<Int>? = nil) {
        
        self.columns = columns
        self.index = index
        self.data = data
        


        if( columns != nil) {

                do {
                // Check if Nr. col is equal to Nr. Arrays
                let y = try! check(arr1: self.data!, arr2: self.columns!)
                } 


            }
        else {

                var arr = Array(0 ..< self.data!.count)
                var stringArray = arr.map { String($0) }
                self.columns = stringArray

        }
        
        if (self.data != nil) {
     
        // You cannnot loop over optional the ! makes sure that you can loop over it
        for (i, val) in self.columns!.enumerated() {
                    hashTable[val] = self.data![i]
                }
        // self.hashTable = hashTable
            }
    }

    // Subscript columsn e.g. df["col1"]
    subscript(columns: String) -> Any {
        
        return hashTable[columns]

    }


}
