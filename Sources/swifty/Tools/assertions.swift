enum dataError: Error {
    case diffShape
}


func check(arr1: Array<Any>, arr2: Array<Any>) throws {
    guard arr1.count == arr2.count else {
        throw dataError.diffShape
    }
}