//
//  AppDelegate.swift
//  Catstagram-Starter
//
//  Created by Luke Parham on 2/9/17.
//  Copyright © 2017 Luke Parham. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = WindowWithStatusBar(frame: UIScreen.main.bounds)
        let rootNavController = UINavigationController(rootViewController: CatFeedViewController())
        
        let font = UIFont(name: "OleoScript-Regular", size: 20.0)!
        rootNavController.navigationBar.titleTextAttributes = [NSFontAttributeName: font]
        rootNavController.navigationBar.barTintColor = .white
        rootNavController.navigationBar.isOpaque = true
        rootNavController.navigationItem.titleView?.isOpaque = true
        rootNavController.navigationBar.isTranslucent = false
        window?.rootViewController = rootNavController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    
    
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {

        let appearance = UINavigationBar.appearance()
        appearance.backgroundColor = .white
        appearance.barTintColor = .white
        //  这么一搞， 提升相当 明显
        //  有配对比图的， 都是用的 模拟器
        DispatchQueue.global(qos: .background).async {
            CoolLogger.reportLogs()
        }   //
        
        
        /*
         We know this logging does not have to happen
         immediately, nothing is depending on it in our app,
         it is just something that gathers some information
         and sends it off to a server somewhere.
         
         So what we can do is just go ahead and throw this
         on a low priority background thread.
         
         and that way it will be out of our way
         when we are launching our app.
         */
        
        
        return true
    }
}

