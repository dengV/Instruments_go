 

import UIKit

@UIApplicationMain
public final class AppDelegate: UIResponder, UIApplicationDelegate {

  public var window: UIWindow?

  public func application(_ application: UIApplication,
                          didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    configureRootViewController()
    return true
  }
  
  private func configureRootViewController() {
    let viewController = window!.rootViewController as! WelcomeViewController
    viewController.delegate = self
  }
}

// MARK: - WelcomeViewControllerDelegate
extension AppDelegate: WelcomeViewControllerDelegate {
  
  public func welcomeViewControllerDonePressed(_ controller: WelcomeViewController) {
    
    let newWindow = UIWindow(frame: window!.bounds)
    newWindow.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
    newWindow.makeKeyAndVisible()
    newWindow.alpha = 0.0
    
    UIView.animate(withDuration: 0.33, animations: {
      newWindow.alpha = 1.0
      
    }, completion: { _ in
      self.window = newWindow
    })
  }
}
