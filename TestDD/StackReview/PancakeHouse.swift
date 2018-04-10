

import UIKit
import CoreLocation

public struct PancakeHouse {
  
  // MARK: - Instance Properties
  
  public let name: String
  public let photo: UIImage?
  public let thumbnail: UIImage?
  public let priceGuide: PriceGuide
  public let location: CLLocationCoordinate2D?
  public let details: String
  public let rating: PancakeRating
  
  // MARK: - Object Lifecycle
  
  public init?(dictionary: [String : Any]) {
    guard let name = dictionary["name"] as? String,
      let priceGuideRaw = dictionary["priceGuide"] as? Int,
      let priceGuide = PriceGuide(rawValue: priceGuideRaw),
      let details = dictionary["details"] as? String,
      let ratingRaw = dictionary["rating"] as? Int,
      let rating = PancakeRating(value: ratingRaw) else {
        return nil
    }
    
    self.name = name
    self.priceGuide = priceGuide
    self.details = details
    self.rating = rating
    
    if let imageName = dictionary["imageName"] as? String , !imageName.isEmpty {
      photo = UIImage(named: imageName)
    } else {
      photo = nil
    }
    
    if let thumbnailName = dictionary["thumbnailName"] as? String , !thumbnailName.isEmpty {
      thumbnail = UIImage(named: thumbnailName)
    } else {
      thumbnail = nil
    }
    
    if let latitude = dictionary["latitude"] as? Double,
      let longitude = dictionary["longitude"] as? Double {
      location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    } else {
      location = nil
    }
  }
  
  // MARK: - Load from Dictionary Array
  
  public static func from(_ array: [[String : Any]]) -> [PancakeHouse] {
    return array.map { PancakeHouse(dictionary: $0) }
      .filter { $0 != nil }
      .map { $0! }
  }
}

// MARK: - CustomStringConvertible

extension PancakeHouse : CustomStringConvertible {
  public var description : String {
    return "\(name) :: \(details)"
  }
}


// MARK: - Equatable

extension PancakeHouse: Equatable {
  public static func ==(lhs: PancakeHouse, rhs: PancakeHouse) -> Bool {
    return lhs.name == rhs.name
  }
}
