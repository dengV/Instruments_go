 

import Foundation

class DataLoadOperation: AsyncOperation {
  
  fileprivate let url: URL
  fileprivate let completion: ((Data?) -> ())?
  fileprivate var loadedData: Data?
  
  init(url: URL, completion: ((Data?) -> ())? = nil) {
    self.url = url
    self.completion = completion
    super.init()
  }
  
  override func main() {
    if self.isCancelled { return }
    NetworkSimulator.asyncLoadDataAtURL(url) {
      data in
      if self.isCancelled { return }
      self.loadedData = data
      self.completion?(data)
      self.state = .Finished
    }
  }
}

extension DataLoadOperation: ImageDecompressionOperationDataProvider {
  var compressedData: Data? { return loadedData }
}
