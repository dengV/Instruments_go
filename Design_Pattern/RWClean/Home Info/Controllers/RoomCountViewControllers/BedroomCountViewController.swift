 

import UIKit

public class BedroomCountViewController: RoomCountViewController {
  
  // MARK: - Instance Properties  
  internal override var initialCount: UInt {
    return homeInfo.bedroomCount
  }
  
  internal override var count: UInt {
    didSet {
      homeInfo.setBedroomCount(count)
    }
  }
}
