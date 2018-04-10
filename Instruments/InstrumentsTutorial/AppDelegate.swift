

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

extension UINavigationController {
    open override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}



/*
 From Xcode’s menu bar, select Product\Profile, or press ⌘I. This will build the app and launch Instruments. You will be greeted with a selection window that looks like this:
 
 
 
 
 
 
 
 
 
 
 Select the Time Profiler instrument and click Choose. This will open up a new Instruments document. Click the red record button in the top left to start recording and launch the app. You may be asked for your password to authorize Instruments to analyze other processes — fear not, it’s safe to provide here! :]
 
 In the Instruments window, you can see the time counting up, and a little arrow moving from left to right above the graph in the center of the screen. This indicates that the app is running.
 */
