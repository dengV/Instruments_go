 

import UIKit

 
// MARK: - AuthControllerDelegate
internal protocol AuthControllerDelegate{
    // AuthControllerDelegate ， 登录 / 注册 两个 控制器， 都使用
    
    // This lets the controllers notify the AuthClient
    //  whenever something happens, including sigin-in requests,
    //  register requests, along with cancellation.
    
    // 登录， 注册 两个 Controller 与 AuthClient 之间 交互
    
    //  In turn , AuthClient handles the authentication networking calls,
    //  and it delegates for the ViewControllers via this protocol.
    
    //  In the event of error, a Failure closure is called on the requesting controller.
    
    // In the event of a successful sign-in or registration,
    //  the window showing the ViewController more on this later, is dismissed.
    //  所以呢？ there actually is not a need for a Success closure here.
    //  
  
  func signInCancelled(on controller: UIViewController)
  
  func signInRequested(on controller: UIViewController,
                       email: String,
                       password: String,
                       failure: @escaping (SignInError) -> Void)
  
    
  func registerRequested(on controller: UIViewController,
                         email: String,
                         password: String,
                         firstName: String,
                         lastName: String,
                         phoneNumber: String,
                         failure: @escaping (RegisterError) -> Void)  
}
 

 
 
 
// MARK: - SignInError
public enum SignInError: Error {
  
  case invalidCredentials
  case networkProblem(Error)
  case unknown(URLResponse?)
  
  internal init(error: Error) {
    self = .networkProblem(error)
  }
  
  internal init(response: URLResponse?) {
    guard let httpResponse = response as? HTTPURLResponse else {
      self = .unknown(response)
      return
    }
    
    switch httpResponse.statusCode {
    case 404: self = .invalidCredentials
    default: self = .unknown(response)
    }
  }
}

 
 
 
// MARK: - RegisterError
internal enum RegisterError: Error {
  
  case emailTaken
  case networkProblem(Error)
  case unknown(URLResponse?)
  
  internal init(error: Error) {
    self = .networkProblem(error)
  }
  
  internal init(response: URLResponse?) {
    guard let httpResponse = response as? HTTPURLResponse else {
      self = .unknown(response)
      return
    }
    switch httpResponse.statusCode {
    case 404: self = .emailTaken
    default: self = .unknown(httpResponse)
    }
  }
}
