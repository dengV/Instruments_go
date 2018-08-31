 

import Foundation

public enum RoomSize: String {
  case small
  case medium
  case large
  
  public var displayTitle: String {
    switch self {
    case .small: return NSLocalizedString("Small", comment: "")
    case .medium: return NSLocalizedString("Medium", comment: "")
    case .large: return NSLocalizedString("Large", comment: "")
    }    
  }
  
  public var index: Int {
    switch self {
    case .small:  return 0
    case .medium: return 1
    case .large: return 2
    }
  }
  
  public init(index: Int) {
    precondition(index >= RoomSize.small.index)
    precondition(index <= RoomSize.large.index)
    switch index {
    case RoomSize.small.index: self = .small
    case RoomSize.medium.index: self = .medium
    case RoomSize.large.index: self = .large
    default: fatalError("Unsupported RoomSize index")
    }
  }
}
