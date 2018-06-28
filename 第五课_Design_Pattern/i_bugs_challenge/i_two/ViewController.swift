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
        
        // 清空， 从新 开始
        
        for _ in 0..<3 {
            
            DispatchQueue.global(qos: .background ).async {
                // 妈的， 先来一个 并发 + 异步
                
                multicastDelegate.addClosurePair(delegate, success: { }, failure: { })
                // addClosurePair 是 并发 ， 同步
                
                
                
                print("count: \(multicastDelegate.count)")
                // 其实结果 也有 道理， 1 2 3
                // 或者是 3，   3，   3
                
                
                // 结果 也还行， 不太完美
            }
            
        }

    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

