// If you want to rename a key you actually delete the key value pair from the dictionary
// and then you create a new key with the changed name
func switchKey<T, U>(_ myDict: inout [T:U], fromKey: T, toKey: T) {
    if let entry = myDict.removeValue(forKey: fromKey) {
        myDict[toKey] = entry
    }
}  

