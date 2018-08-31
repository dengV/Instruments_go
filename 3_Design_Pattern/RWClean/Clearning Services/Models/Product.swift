 

import Foundation

public final class Product {
  
  // MARK: - Constants
  public enum ProductType: String {
    case business
    case home
    
    public var title: String {
      switch self {
      case .business:
        return NSLocalizedString("Business", comment: "")
      case .home:
        return NSLocalizedString("Home", comment: "")
      }
    }
  }
  
  internal struct Keys {
    static let id = "id"
    static let imageURL = "image_url"
    static let priceHourly = "price_hourly"
    static let priceSquareFoot = "price_square_foot"
    static let productDescription = "product_description"
    static let title = "title"
    static let type = "type"
  }
  
  internal static var tableName = "products"
  
  // MARK: - Instance Properties
  public let identifier: Int?
  public let imageURL: URL?
  public let priceHourly: Double
  public let priceSquareFoot: Double
  public let productDescription: String
  public let title: String
  public let type: ProductType
  
  // MARK: - Object Lifecycle
  public init?(json: [String: Any]) {
    
    let imageURL: URL?
    
    if let imageURLString = json[Keys.imageURL] as? String {
      imageURL = URL(string: imageURLString)
      
    } else {
      imageURL = nil
    }
    
    guard let identifier = json[Keys.id] as? Int,
      let priceHourly = json[Keys.priceHourly] as? Double,
      let priceSquareFoot = json[Keys.priceSquareFoot] as? Double,
      let productDescription = json[Keys.productDescription] as? String,
      let title = json[Keys.title] as? String,
      let rawType = json[Keys.type] as? String,
      let type = ProductType(rawValue: rawType) else {
        return nil
    }
    self.identifier = identifier
    self.imageURL = imageURL
    self.priceHourly = priceHourly
    self.priceSquareFoot = priceSquareFoot
    self.productDescription = productDescription
    self.title = title
    self.type = type
  }
  
  public init(imageURL: URL?,
              priceHourly: Double,
              priceSquareFoot: Double,
              productDescription: String,
              title: String,
              type: ProductType) {
    
    self.identifier = nil
    self.imageURL = imageURL
    self.priceHourly = priceHourly
    self.priceSquareFoot = priceSquareFoot
    self.productDescription = productDescription
    self.title = title
    self.type = type
  }
  
  // MARK: - Class Constructors
  public class func array(jsonArray: [[String: Any]]) -> [Product] {
    var array: [Product] = []
    for json in jsonArray {
      guard let product = Product(json: json) else { continue }
      array.append(product)
    }
    return array
  }
}
