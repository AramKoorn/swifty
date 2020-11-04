/**
DataFrame core
 */
public struct DataFrame {


    var columns: Array<String>?
    var index: Array<Any>?
    var data: Array<Any>?

    //  e.g.
    //["col1": ["index": [1, 2, 3, 4], "data": ["col1": [1, 2, 3, 4], "col2": [3, 4, 5, 6]]]
    var hashTable = Dictionary<AnyHashable, Any>()   
    
    /// Initalizes the DataFrame
    ///   - Parameters:
    ///   - data: Data. 
    ///   - columns: columns of the dataframe.
    ///   - index: Array with indexing.  
    public init( data: Array<Any>? = nil, columns: Array<String>? = nil, index: Array<Any>? = nil) {
        
        self.columns = columns
        self.index = index
        self.data = data
        
        // create index if it is not specified
        if (self.index == nil) {
            
            let row = self.data![0] as! Array<Any>
            self.index = Array(0 ..< row.count) // int by default

        }

        // init the index
        hashTable["index"] = self.index
 
        // Create columns if they are nil
        if (self.columns == nil) {

            // check
            // do {
            //     // Check if Nr. col is equal to Nr. Arrays
            //     let y = try! check(arr1: self.data!, arr2: self.columns!)
            // } 

            let arr = Array(0 ..< self.data!.count)
            self.columns = arr.map { String($0) }
        }
        
        if (self.data != nil) {

            var tmp = Dictionary<String, Any>()
            for (idx, col) in self.columns!.enumerated() {
                // tmp.append([col: self.data![idx]])
                tmp[col] = self.data![idx]
            }
            hashTable["data"] = tmp 
            }
        }

        public mutating func updateSelf(table: Dictionary<AnyHashable, Any> ) {

            self.index = hashTable["index"] as! Array<Any>?
            
            var sub = hashTable["data"] as! Dictionary<String, Array<Any>>
            var test = 1

            self.columns = Array(sub.keys)
            self.data = Array(sub.values)

        }
   
        public func printHashtable() {
            print(hashTable)
        }


    }


        // // Create a range index if index was not supplied and there is data
        // if (self.index == nil && self.data != nil) {
        //     // Check if number of index elements are equal to number of rows
            
        //     // Create index SubSequence {
        //     // self.index = Array(0 .. < tmp.count)
        //     var row = self.data![0] as! Array<Any>
        //     self.index = Array(0 ..< row.count)
        //     }   
        
        // //Create ref table for the index 
        // for (idx, x) in self.index!.enumerated() {
        //     var tmp = [Any]()
        //     for (val) in self.data! {
        //         // Make sure that we go from Any to an Array<Any>
        //        var tmp2 = val as! Array<Any>
        //        //print(tmp2)
        //        tmp.append(tmp2[idx])
        //     }
        //     hashTableIndex[x] = tmp
        // }

        // for (k, v) in hashTableIndex {
        //     print("key:  \(k)")
        //     print("value:  \(v)")
        // }

     
    //}


// }

// extension DataFrame{

//     mutating func test() {
//         print("This does nothing yet")
//     }

    
// }
