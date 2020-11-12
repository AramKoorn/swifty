// The building block of a DataFrame
//

// todo: add features like values count etc.
public struct Series<SwiftyType> {
    public var values: Array<SwiftyType>

    public init(values: Array<SwiftyType>) {
        self.values = values
    }
}

extension Series where SwiftyType == Int {
    public func mean() -> Double {
        
        let tmp = values.compactMap(Double.init)
        let total = tmp.reduce(0, +)
        let average = total / Double(values.count)
        return average
    }
}

extension Series where SwiftyType == Int {
    public func sum() -> Int {
        let total = values.reduce(0, +)
        return total
    }
}

extension Series where SwiftyType == Double {
    public func mean() -> Double {
        let total = values.reduce(0, +)
        let average = total / Double(values.count)
        return average
    }
}

extension Series where SwiftyType == Double {
    public func sum() -> Double {
        let total = values.reduce(0, +)
        return total
    }
}