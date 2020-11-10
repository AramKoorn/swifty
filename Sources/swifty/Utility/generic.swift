// If you want to rename a key you actually delete the key value pair from the dictionary
// and then you create a new key with the changed name
func switchKey<T, U>(_ myDict: inout [T:U], fromKey: T, toKey: T) {
    if let entry = myDict.removeValue(forKey: fromKey) {
        myDict[toKey] = entry
    }
}  

func uniqKeepOrder<S : Sequence, T : Hashable>(source: S) -> [T] where S.Iterator.Element == T {
    var buffer = [T]()
    var added = Set<T>()
    for elem in source {
        if !added.contains(elem) {
            buffer.append(elem)
            added.insert(elem)
        }
    }
    return buffer
}
// extension DataFrame1 {
//     public func selDict(col
//     : String) -> Dictionary<String, Series<SwiftyType>> {
            
//         if hashTypes[col]! == "Int" {
//             return hashInt
//         }
//         if hashTypes[col]! == "Double" {
//             return hashDouble
//         }

//         if hashTypes[col]! == "String" {
//             return hashString
//         }
//     }
// }
