// The building block of a DataFrame
//

// todo: add features like values count etc.
public struct Series<SwiftyType> {
    public var values: Array<SwiftyType>

    public init(values: Array<SwiftyType>) {
        self.values = values
    }
}
