 

import Foundation

// MARK: - AuthToken
public protocol AuthToken {
  func authenticationHeaders() -> [String: String]
}

extension AuthToken {
  public func setAuthenticationHeaders(on request: inout URLRequest) {
    let headers = authenticationHeaders()
    headers.forEach { (key, value) in
      request.setValue(value, forHTTPHeaderField: key)
    }
  }
}

 
 
//  Whenever a user successfully registers,
//  or signs in the app, a new AuthToken is created.

 // AuthToken 是 对外接口协议， is an externally - facing protocol.
 // It is meant to be consumed, meaning used by external classes , like network client,
 //  也可能，    or potentially, future end points requiring authentication.
 // This protocol simply defines methods,
 // to set the authentication headers, and get the authentication headers
 
 
 
 
 
 
