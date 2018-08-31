 

import UIKit

public class OtherRoomCountViewController: RoomCountViewController {
  
  // MARK: - Instance Properties  
  internal override var initialCount: UInt {
    return homeInfo.otherRoomsCount
  }
  
  internal override var count: UInt {
    didSet {
      homeInfo.setOtherRoomsCount(count)
    }
  }
}
