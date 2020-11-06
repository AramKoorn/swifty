public struct DataFrame1{
    
    // Initializers
    var data: Array<Array<Any>>?
    var columns: [String]? // columns can be int, double or string
    var index: [Int]?
    
    // Hashtables --> Keys are the columns
    var hashInt = Dictionary<String, Series<Int>>()
    var hashDouble = Dictionary<String, Series<Double>>()
    var hashString = Dictionary<String, Series<String>>()

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

        // Cast each array to Series with correct type
        data!.forEach {
        var i = 0
        guard !$0.isEmpty else { return }
        switch $0.first {
        case _ as Int:
            var series = handleIntArray($0 as! [Int])
            hashInt[self.columns![i]] = series
            i += 1
        case _ as Double:
            var series = handleDoubleArray($0 as! [Double])
            hashDouble[self.columns![i]] = series
            i += 1
        case _ as String:
            var series = handleStringArray($0 as! [String])
            hashString[self.columns![i]] = series
            i += 1
        default:
            print("Unsupported type")
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