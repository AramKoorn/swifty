// The building block of a DataFrame
//

// todo: add features like values count etc.
public struct Series<SwiftyType> {
    var values: Array<SwiftyType>

    init(values: Array<SwiftyType>) {
        self.values = values
    }
}