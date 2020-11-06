public extension DataFrame {

    public func query(column: String, values: Array<Any>?) -> DataFrame {

        var store_index = [Int]()


        var dict = castToDict(notDictYet: hashTable["data"])
        var vals = values as! [String]
        var t = 1
        
        //var castValues = values!


        for (idx, val) in dict[column]!.enumerated() {
            if (vals.contains(val as! String) ) {
                store_index.append(idx)
            }
            print(idx, val, vals)
        }
        
        var x = 2


        return DataFrame(data: [[]])
    }

}