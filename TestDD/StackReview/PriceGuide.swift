

import Foundation

public enum PriceGuide : Int {
  case unknown = 0
  case low = 1
  case medium = 2
  case high = 3
}

// MARK: - CustomStringConvertible

extension PriceGuide : CustomStringConvertible {
  public var description : String {
    switch self {
    case .unknown:
      return "?"
    case .low:
      return "$"
    case .medium:
      return "$$"
    case .high:
      return "$$$"
    }
  }
}
