 

import UIKit

public class BathroomCountViewController: RoomCountViewController {
 
  // MARK: - Instance Properties  
  internal override var initialCount: UInt {
    return homeInfo.bathroomCount
  }
  
  internal override var count: UInt {
    didSet {
      homeInfo.setBathroomCount(count)
    }
  }
}
