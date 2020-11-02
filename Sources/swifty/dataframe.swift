public struct DataFrame {
    
    // Force columns to be strings for now
    
    var columns: Array<String>?
    var index: Array<Int>?
    var data: Array<Any>?

    // To select coluvaluesmns/
    var hashTable = Dictionary<String, Any>()
    var hashTableIndex = Dictionary<AnyHashable, Any>()
    
    
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



        // if you fill in an index it means you have dasta
        if (self.index == nil) {
            // Check if number of index elements are equal to number of rows
            
            // Create index SubSequence {
           // self.index = Array(0 .. < tmp.count)
            }   
        
        //Create ref table for the index 
        for (idx, x) in self.index!.enumerated() {
            var tmp = [Any]()
            for (val) in self.data! {
                // Make sure that we go from Any to an Array<Any>
               var tmp2 = val as! Array<Any>
               //print(tmp2)
               tmp.append(tmp2[idx])
            }
            hashTableIndex[x] = tmp
        }

        for (k, v) in hashTableIndex {
            print("key:  \(k)")
            print("value:  \(v)")
        }

     
    }

    // Subscript columns e.g. df["col1"]
    // subscript should eventually return DataFrame
    public subscript(columns: Array<String>) -> Any {

        var dict_sub = hashTable.filter({  columns.contains($0.key) })
        //updateMembers(hashTable: hashTable, hashTableIndex: hashTableIndex) 
        //self.test()
        return dict_sub

    }


    mutating func updateMembers(hashTable: Dictionary<String, Any>, hashTableIndex: Dictionary<AnyHashable, Any>){
        print(Array(hashTable.keys))
        //self.columns = Array(hashTable.keys)

    }


}

extension DataFrame {

    mutating func test() {
        print("This does nothing yet")
    }

    
}


// How to filter dictionaries
// var sel = ["Tom", "Fabien"]
// var namesAndAges = ["Tom": 25, "Michael": 35, "Harry": 28, "Fabien": 16]
// var underAge = namesAndAges.filter({  sel.contains($0.key) }) // [(key: "Fabien", value: 16)]
// print(underAge)