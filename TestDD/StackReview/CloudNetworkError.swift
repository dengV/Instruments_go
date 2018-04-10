

import Foundation

public enum CloudNetworkError: Error {
  
  /* Indicates login failed due to invalid credentials */
  case invalidCredentials
  
  /* Indicates request failed because the user isn't authenticated */
  case notAuthenticated
  
  /* Indicates an unknown error occurred */
  case unknown
}

// MARK: - CustomStringConvertible

extension CloudNetworkError: CustomStringConvertible {
  public var description: String {
    switch self {
    case .invalidCredentials:   return "Invalid Credentials"
    case .notAuthenticated:     return "Not Authenticated"
    case .unknown:              return "Unknown"
    }
  }
}
