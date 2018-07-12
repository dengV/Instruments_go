//
//  ViewController.swift
//  Async
//
//  Created by dengjiangzhou on 2018/7/12.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let userQueue = DispatchQueue.global(qos: .userInitiated)
    let defaultQueue = DispatchQueue.global()
    let mainQueue = DispatchQueue.main
    
    
    let dengSerialQueue = DispatchQueue(label: "com.deng.thread.start")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // comeAConcurrency()
        
        
        let interval = duration {
            dengSerialQueue.async {
                self.taskOne()
            }// now dispatch the tasks onto the queue.
            
            
            dengSerialQueue.async {
                self.taskTwo()
            }
            
        }// Serial Interval : 5.9962272644043e-05
        // 也很快就完成了
        
        
        
        print("Serial Interval : \(interval)")
    }
    
    
    
    
    func comeAConcurrency(){
        let interval = duration {
            userQueue.async {
                self.taskOne()
            }
            
            
            userQueue.async {
                self.taskTwo()
            }
            
        }
        // interval : 4.99486923217773e-05
        // You know task one takes
        // at least one second,
        // but the duration is much, much less.
        // 原因如下，
        // Because the current thread was not blocked by the tasks.
        // it just returned as soon as it finished dispatching the task off to the queue.
        // 精彩的 答疑
        
        print("interval : \(interval)")
    }
    
    func taskOne(){
        print("Task 1 started")
        sleep(1)
        print("Task 1 finished")
    }
    

    func taskTwo(){
        print("Task 2 started")
        
        print("Task 2 finished")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

