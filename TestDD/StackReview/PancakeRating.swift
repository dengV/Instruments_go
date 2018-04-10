

import UIKit

public enum PancakeRating {
  
  // MARK: - Cases
  
  case unknown
  case rating(Int)
    
  // MARK: - Computed Properties
  
  public var ratingImage : UIImage? {
    guard let baseName = ratingImageName else {
      return nil
    }
    return UIImage(named: baseName)
  }
  
  public var smallRatingImage : UIImage? {
    guard let baseName = ratingImageName else {
      return nil
    }
    return UIImage(named: "\(baseName)_small")
  }
  
  fileprivate var ratingImageName : String? {
    switch self {
    case .unknown:
      return nil
    case .rating(let value):
      return "pancake_rate_\(value)"
    }
  }
  
  public var value: Int? {
    switch self {
    case .rating(let value):
      return value
    case .unknown:
      return nil
    }
  }
  
  // MARK: - Object Lifecycle
  
  public init?(value: Int) {
    if value > 0 && value <= 5 {
      self = .rating(value)
    } else {
      self = .unknown
    }
  }
}

extension PancakeRating: Equatable {  
  public static func ==(lhs: PancakeRating, rhs: PancakeRating) -> Bool {
    return lhs.value == rhs.value
  }
}
