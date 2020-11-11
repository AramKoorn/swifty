public extension DataFrame {

    public mutating func query(column: String, values: [Any]) {

      //indices to keep 
      var storeIndex = [Int]()

      // add indices to StoreIndex 
      if hashTypes[column]! == "Int" {
          var val = values as! [Int]
          let l = hashInt[column]!.values
          for v in val {
            let idx = l.indices.filter {l[$0] == v}
            storeIndex += idx
          }
      }
      if hashTypes[column]! == "Double" {
          var val = values as! [Double]
          let l = hashDouble[column]!.values
          for v in val {
            let idx = l.indices.filter {l[$0] == v}
            storeIndex += idx
          }
      }
      if hashTypes[column]! == "String" {
          var val = values as! [String]
          let l = hashString[column]!.values
          for v in val {
            let idx = l.indices.filter {l[$0] == v}
            storeIndex += idx
          }
      }

      // filter the index
      self.index! = storeIndex.map {self.index![$0] }
     
      // Update data based on index
      updateDataOnIndex()

  }

}
