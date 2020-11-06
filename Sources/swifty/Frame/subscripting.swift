// Subscript columns e.g. df["col1"]
// subscript should eventually return DataFrame
extension DataFrame {
public subscript(columns: Array<Any>) -> Array<Any> {



    get {
            let cols = columns.compactMap { $0 as? String }

    //var dict_sub = hashTable.filter({  columns.contains($0.key) })
    //updateMembers(hashTable: hashTable, hashTableIndex: hashTableIndex) 
    //self.test(

    
    var sub = hashTable["data"] as! Dictionary<String, Array<Any>>
    var dict_sub = sub.filter({  cols.contains($0.key) }) 
    return DataFrame(data: Array(dict_sub.values), columns: Array(dict_sub.keys), index: self.index).data!
    }

    set {
    var sub = hashTable["data"] as! Dictionary<String, Any>
    
    if (columns.count > 1 ) {

    }
    else {
            let cols = columns.compactMap { $0 as? String }

        sub[cols[0]] = newValue
        hashTable["data"] = sub
    }

    updateSelf(table: hashTable)
    // data = Array(sub.values)
    // columns =  Array(sub.keys)

    //DataFrame(data: Array(sub.values), columns: Array(sub.keys), index: self.index)


       
    }
}
}


// extension DataFrame1 {
// public subscript(columns: [String]) -> Any {



//     get {


           
//     }

//     set {
       
//     }
// }
// }
