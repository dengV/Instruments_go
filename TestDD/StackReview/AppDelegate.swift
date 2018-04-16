

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    // Override point for customization after application launch.
    
    let splitViewController = self.window!.rootViewController as! UISplitViewController
    
    let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
    
    navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
    
    splitViewController.delegate = self
    
    window?.tintColor = UIColor.pancakeDarkOrange
    
    return true
  }
    
  
  // MARK: - Split view
  
  func splitViewController(_ svc: UISplitViewController, shouldHide vc: UIViewController, in orientation: UIInterfaceOrientation) -> Bool {
    
    return false
  }
    
    
  
  func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
    guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
    
    guard let topAsDetailController = secondaryAsNavController.topViewController as? PancakeHouseViewController else { return false }
    
    if topAsDetailController.pancakeHouse == nil {
      // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
      return true
    }
    return false
  }
  
}

