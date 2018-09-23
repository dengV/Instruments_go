 

import UIKit

 
import CoreData
 
 
 
 

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
    
    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "PatPal")
        

        // need to load up our data model.
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            print(storeDescription)
            
            if let error = error{
                fatalError("Unresolved error \(error.localizedDescription)")
            }   //  if let error = error
            
        })
        
        return container
    }()
    
    
    
    func saveContext(){
        let context = persistentContainer.viewContext
        // first, need to get a reference to my context, form `persistentContainer`
        
        if context.hasChanges{
            //    see if there has been any changes in this context.
            
            
            do{
                try context.save()
                // 有变化， 就尝试保存
            }
            catch{
                fatalError("Unresolved error \(error.localizedDescription)")
                
            }
            
            
        }   //  if context.hasChanges
        
        
    }   // func saveContext()

    
    
    
    

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
        
        
        print("Documents Directory: ", FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last ?? "Not Found!")
        
        
		return true
	}
    
/*
     
     <NSPersistentStoreDescription: 0x600000449120> (type: SQLite, url: file:///Users/dengjiangzhou/Library/Developer/CoreSimulator/Devices/256445C4-6172-4C10-B3AE-EC94E31CBB77/data/Containers/Data/Application/97E6F1AA-B41E-4FCC-8074-408096F55489/Library/Application%20Support/PatPal.sqlite)
     
     Documents Directory:  file:///Users/dengjiangzhou/Library/Developer/CoreSimulator/Devices/256445C4-6172-4C10-B3AE-EC94E31CBB77/data/Containers/Data/Application/97E6F1AA-B41E-4FCC-8074-408096F55489/Documents/
     
     
     
     */
    
    
    

	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}


}

