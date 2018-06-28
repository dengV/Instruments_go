//
//  ViewController.swift
//  i_two
//
//  Created by dengjiangzhou on 2018/6/15.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        let multicastDelegate = MulticastClosureDelegate<Success, Failure>()
        let delegate = NSObject()
        // delegate , 作为 key
        
        
        multicastDelegate.addClosurePair(delegate, success: {
            print("Success")
        }) {
            print("Failure")
        }
        
        
        /*
         
         例子一
         
         let callback = multicastDelegate.mapTable.object(forKey: delegate)?.firstObject as! MulticastClosureDelegate<Success, Failure>.CallBack
         //  to get the success closure, we have to go through
         //  a bit of hoops , jumping through the map table
         //  to get its first object, and then casting it to the correct type.
         //  投篮命中， 按键取值， 再来个 强制转型
         */
        
        
        
        let callback = multicastDelegate.getCallBacks(removeAfter: false).first!
        
        
        let success = callback.success
        
        
        success()
        
        
        print("\n\n")
        
        
        
        let (successClosure, _) = multicastDelegate.getSuccessTuples(removeAfter: false).first!
        
        
        successClosure()
        
        let (failureClosure, _) = multicastDelegate.getFailureTuples(removeAfter: false).first!
        
        failureClosure()
        
        
        print( "multicastDelegate.count is \(multicastDelegate.count)")
        
        
        
        // MARK: - Multithreading
        print("-- Multithreading --")
      //   multicastDelegate.mapTable.removeAllObjects()
        multicastDelegate.mapTable.unsafeValue.removeAllObjects()
        
        
        // 清空， 从新 开始
        
        for _ in 0..<3 {
            
            DispatchQueue.global(qos: .background ).async {
                multicastDelegate.addClosurePair(delegate, success: { }, failure: { })
                print("count: \(multicastDelegate.count)")
            }
            
        }
/*
         If MulticastClosureDelegate was thread safe, you should see print statements counting from 1 to 3 in the console... however, this always prints 1!
         This confirms that MulticastClosureDelegate is not thread safe.
         */
        
        
/*
         
         Note: well technically, since this is dispatched asynchronously, you would expect to see print statements counting from "1 to 3", "all 3s", "1, 3, 3" or even "2, 3, 3."
         Any of these would be acceptable, as each would indicate the closure pairs were all added.
         */

        
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

