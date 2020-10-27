print("Hello, world!")


public struct DataFrame {
    
    // Force columns to be strings for now
    
    var columns: Array<String>?
    var index: Array<Int>?
    var data: Array<Array<Any>>?
    
    
    
    init(columns: Array<String>? = nil, index: Array<Int>? = nil, data: Array<Array<Any>>? = nil) {
        
        self.columns = columns
        self.index = index
        self.data = data
        
        var hashTable: Dictionary<String, Array<Any>>
        
        if (self.columns != nil) {
     
     // You cannnot loop over optional the ! makes sure that you can loop over it
     for (element) in self.columns! {
                print(element)
            }
        }
        
    }
}