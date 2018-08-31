 

import Foundation

public final class User {
  
  // MARK: - Constants
  internal struct Keys {
    static let id = "id"
    static let email = "email"
    static let firstName = "first_name"
    static let phoneNumber = "phone_number"
    static let lastName = "last_name"
  }
  
  // MARK: - Intance Properties
  public var id: Int
  public var email: String
  public var firstName: String
  public var phoneNumber: String
  public var lastName: String
    
  // MARK: - Object Lifecycle
  public convenience init?(jsonData data: Data) {
    guard let jsonObject = try? JSONSerialization.jsonObject(with: data),
      let dictionary = jsonObject as? [AnyHashable: Any] else {
        return nil
    }
    self.init(dictionary: dictionary)
  }
  
  public init?(dictionary: [AnyHashable: Any]) {
    
    guard let id = dictionary[Keys.id] as? Int,
      let email = dictionary[Keys.email] as? String,
      let firstName = dictionary[Keys.firstName] as? String,
      let phoneNumber = dictionary[Keys.phoneNumber] as? String,
      let lastName = dictionary[Keys.lastName] as? String else {
        return nil
    }
    
    self.id = id
    self.email = email
    self.firstName = firstName
    self.phoneNumber = phoneNumber
    self.lastName = lastName
  }
}
