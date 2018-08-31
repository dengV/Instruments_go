 

import Foundation

struct NetworkSimulator {
  static func asyncLoadDataAtURL(_ url: URL, completion: @escaping ((_ data: Data?) -> ())) {
    DispatchQueue.global(qos: .default).async {
      let data = syncLoadDataAtURL(url)
      DispatchQueue.main.async {
        completion(data)
      }
    }
  }
  
  static func syncLoadDataAtURL(_ url: URL) -> Data? {
    // Wait somewhere between 0 and 3 seconds
    let randomWaitingTime = arc4random_uniform(2 * 1000000)
    usleep(randomWaitingTime)
    return (try? Data(contentsOf: url))
  }
}
