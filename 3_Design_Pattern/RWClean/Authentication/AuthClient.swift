 

import UIKit

 
 
 // 最主要的 文件
 // This is the heart of the auto re-login authentication client for this grouping.
 
 // AuthClient is the only class,
 // that is permitted to hold onto the authentication tokens long-term.
 // 唯一 允许 持有 认证 的 token 通证 信息 的 类
 
 // It is actually the only class that knows about
 // this BasicAuthToken , which implements the AuthToken protocol.
 
 // 类的 封装 出来了
 // This prevents other classes from knowing too much about the AuthToken,
 // and private details on it, sush as the email / the password directly
 
 // This makes it very easy to later switch to another authentication schema.
 // 切换 认证 模式， 非常容易
 // such as JWTVeriToken , 什么鬼
 // We could do this simply by changing the internal structure,遵守 AuthToken 协议的，就好了
 
 // Nothing outside of AuthClient should even know about this.
 // or be affected, this is a win.
 
 
 
 
 // MARK: - AuthControllerDelegate
 extension AuthClient: AuthControllerDelegate {
    //    哟， 扩展 协议 方法
    

 
 
 internal func signInRequested(on controller: UIViewController,
                               email: String,
                               password: String,
                               failure: @escaping (SignInError) -> Void) {
    
    let token = BasicAuthToken(email: email, password: password)
    let url = baseURL.appendingPathComponent("login")
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    token.setAuthenticationHeaders(on: &request)
    
    let task = session.dataTask(with: request) { [weak self] (data, response, error) in
        guard let strongSelf = self else { return }
        if let error = error {
            DispatchQueue.main.async {
                let signInError = SignInError(error: error)
                print("Sign In Failed: \(error)")
                failure(signInError)
            }
            return
        }
        guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode.isSuccessHTTPCode,
            let data = data,
            let user = User(jsonData: data) else {
                DispatchQueue.main.async {
                    let signInError = SignInError(response: response)
                    print("Sign In Failed: \(signInError)")
                    failure(signInError)
                }
                return
        }
        strongSelf.authTuple = (token, user)
        strongSelf.notifySignInSuccess(token, user)
        strongSelf.dismissSignInWindow()
    }
    task.resume()
 }
 
 
 
 
 internal func registerRequested(on controller: UIViewController,
                                 email: String,
                                 password: String,
                                 firstName: String,
                                 lastName: String,
                                 phoneNumber: String,
                                 failure: @escaping (RegisterError) -> Void) {
    
    let token = BasicAuthToken(email: email, password: password)
    let url = baseURL.appendingPathComponent("users")
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    let parameters = [
        "email": email,
        "password": password,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber
    ]
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = try! JSONSerialization.data(withJSONObject: parameters)
    token.setAuthenticationHeaders(on: &request)
    
    let task = session.dataTask(with: request) { [weak self] (data, response, error) in
        guard let strongSelf = self else { return }
        if let error = error {
            DispatchQueue.main.async {
                print("Register Failed: \(error)")
                failure(.networkProblem(error))
            }
            return
        }
        guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode.isSuccessHTTPCode,
            let data = data,
            let user = User(jsonData: data) else {
                let registerError = RegisterError(response: response)
                DispatchQueue.main.async {
                    print("Register Failed: \(registerError)")
                    failure(registerError)
                }
                return
        }
        strongSelf.authTuple = (token, user)
        strongSelf.notifySignInSuccess(token, user)
    }
    task.resume()
 }
 
 private func dismissSignInWindow() {
    DispatchQueue.main.async {
        UIView.animate(withDuration: 0.33, animations: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.window?.alpha = 0.0
            
            }, completion: { [weak self] _ in
                guard let strongSelf = self else { return }
                strongSelf.window = nil
        })
    }
 }
    
    
    internal func signInCancelled(on controller: UIViewController) {
        //  失败， 退出 当前 窗口
        multicastDelegate.getFailureTuples().forEach { (closure, queue) in
            queue.sync(execute: closure)
            //  哟， 看到同步了
        }
        dismissSignInWindow()
        // this simply calls each Failure closure.
        // This is only going to be called if the user deliberately cancels out of the authentication flow
        //  调用 这个， 只有当 用户 故意 取消 认证 流
        
        // This is the only error that can not be handled within the authentication group itself.
        //  So consequently, 传给 请求者
        // Most often, the request will simply be aborted silently.
        
        
        
    }// internal func signInCancelled(on controller: UIViewController)
    
    
    
    private func notifySignInSuccess(_ token: BasicAuthToken, _ user: User) {
        multicastDelegate.getSuccessTuples().forEach { ( successClosure, queue ) in
            queue.sync {
                successClosure(token, user)
            }
            
            // 为什么 不能  queue.sync(execute: )
            
            dismissSignInWindow()
            
            
            // this is if we actually sign in and go through the entire process,
            //  we will notify everyone that is interested in
            //  getting that token , and the user.
            //  其后， 该干嘛， 干嘛
        }
        
        // 调用 getSuccessTuples , 使用了 默认的参数 removeAfter ， 直接删掉了
        // so if a requester gets a success,
        //  it will only be notified of this success, for the one time it is asked for
        
        // failure 失败 请求 类似
        
        //  因为我们已经 实现了 线程 安全，
        //   this is also thread safe, so this can actually handle multiple simultaneous requests happening for an authentication at the same time.
    }
    
    
 }
 
 
 
 
 
 
 
// MARK: - AuthClient
public final class AuthClient {
  
  public typealias Success = (AuthToken, User) -> Void
  public typealias Cancel = () -> Void
  
  // MARK: - Constants
  private struct Keys {
    static let token = "token"
    static let user = "user"
  }
  
  // MARK: - Instance Properties
  public var user: User? {
    return authTuple?.user
  }
  
  fileprivate var authTuple: (token: BasicAuthToken, user: User)?
  fileprivate let baseURL: URL
  fileprivate let session = URLSession.shared  
  fileprivate var window: UIWindow?
    

   fileprivate let multicastDelegate = MulticastClosureDelegate<Success, Cancel>()
    //  牛逼， 没有 Failure 的
    //  其实就是 障眼法， Cancel 等同于 Failure
    
    
  
  // MARK: - Class Constructors
  public static let shared: AuthClient = {
    let file = Bundle.main.path(forResource: "ServerEnvironments", ofType: "plist")!
    let dictionary = NSDictionary(contentsOfFile: file)!
    let urlString = dictionary["auth_url"] as! String
    let url = URL(string: urlString)!
    return AuthClient(baseURL: url)
  }()
  
  // MARK: - Object Lifecycle
  private init(baseURL: URL) {
    self.baseURL = baseURL
  }
  
  // MARK: - Instance Methods
  public func requestAuthToken(_ object: AnyObject,
                               queue: DispatchQueue? = .main,
                               success: @escaping Success,
                               userCancelled: @escaping Cancel) {
    
    if let (token, user) = authTuple {
      success(token, user)
      return
    }
    multicastDelegate.addClosurePair(object, success: success, failure: userCancelled)
    
    guard multicastDelegate.count == 1 else {
        // 卧槽， 线程 保护 吗
        return
    }
    showSignInWindow()
  }
    //  So requestAuthToken is a method that is actually stubbed out which consuming classes can call into if they need to get an authentication token.
    //  requestAuthToken 是一个 支离破碎 的 方法
    
    
    
    
  
  public func signOut() {
    authTuple = nil
  }
  
  private func showSignInWindow(){
    DispatchQueue.main.async { [weak self] in
      guard let strongSelf = self else { return }
      let frame = UIScreen.main.bounds
      let window = UIWindow(frame: frame)
      window.rootViewController = SignInViewController.instanceFromStoryboard(delegate: strongSelf)
      window.makeKeyAndVisible()
      window.alpha = 0.0
      UIView.animate(withDuration: 0.33) { window.alpha = 1.0 }
      strongSelf.window = window
    }
  }//   Instead of requiring your ViewController to present a SignInController here.
    //  卧槽，掌中通， 也是这么搞的， 做的好
    //  AuthClient simply presents its own Window.
    // 毕竟， if a user is blocked , because he is not authenticated, it is likely something he needs to do right away
    //  为了 ， to continue using the app.
    
    // By showing SignInViewController in a new window,
    // it is guaranteed to be shown to the user
    //  above whatever UI is currently happening .
    //  卧槽， 开 Window ， 有这么 多 好处
    
    //  Ideally, if the app were blocked by a networking call,
    //  it would continue onto the next end point .
    //  牛逼啊， end point 不是 终端， 是 发新的 请求
    
    
}

 
 
 
 
 // MARK: - BasicAuthToken
 fileprivate struct BasicAuthToken: AuthToken {
    
    fileprivate var email: String
    fileprivate var password: String
    
    fileprivate func authenticationHeaders() -> [String: String] {
        let data = "\(email):\(password)".data(using: .utf8)!
        let value = data.base64EncodedString()
        return ["Authorization": "Basic \(value)"]
        // wocao , 这个 token 竟然 不是 服务器 返回的
    }
 }
 
 
 
 // MARK: - CustomStringConvertible
 extension BasicAuthToken: CustomStringConvertible {
    
    fileprivate var description: String {
        return "BasicAuthToken: {username: \(email), password: \(password) }"
    }
 }

