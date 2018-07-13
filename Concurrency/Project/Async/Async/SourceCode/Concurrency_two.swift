//
//  Concurrency_two.swift
//  Async
//
//  Created by dengjiangzhou on 2018/7/13.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import Foundation


let concurrent = Concurrency_one()
var value = 42

func code_example_concurrency(){
    
    
    // concurrent.comeASerialQueue()
    
    
    //  comeAConcurrency()
    //  comeASerialQueue()
    // comePrivateConcurrentQueue()
    /*
     Task 2 started
     Task 1 started
     privateConcurrentQueue Interval : 5.10215759277344e-05
     */
    
    
    // comeASecondConcurrency()
    // 做个小实验
    
    
    
    // concurrent.come_race_condition()
    concurrent.come_race_condition_two()
}




// 这就是一个竞争条件

extension Concurrency_one{
    
    func changeValue(){
        sleep(1)
        value = 0
        print("valueW: \(value)")
    }
    
    
    
    func come_race_condition(){
        
        dengSerialQueue.async {
            self.changeValue()
            // 再走这里
        }
        
        print("valueR: \(value)")
        // 先走这里
    }
    
    
    
    func come_race_condition_two(){
        
        dengSerialQueue.sync {
            self.changeValue()
       
        }
        // 阻塞 current thread
        
        
        // Dispatching `changeValue` synchronously
        // is going to block the current thread,
        // until the change value task has finished.
        // thus removing that race condition.
        
        
        // 现在结果就比较顺序执行了。
        // because it had to wait until the `changeValue` task finished.
        
        
        // 请牢记住
        // although an asynchronous call returns right away,
        // we do not know when it's work will actually finish.
        
        
        // So we should not try to use it's results immediately after we call it.
        
        // That is what completionHandlers are for
        // 这就是 completionHandlers 的意义所在
        
        
        // A completionHandler runs exactly when
        // the work has completed.
        // usually returning some results and often error or status info as well.
        
        // 我们就在这里更新 UI
        // So that is where you would update the UI
        // or do what needs doing with the results.
        
        // and that is also why you never dispatch synchronously from the main thread.
        
        // Most of the time the task you dispatched will try to update the UI when it is finished.
        // 然后就在主队列刷新
        
        // if the main queue is waiting for the task to finish,
        // and the task is waiting for the main queue to update the UI.
        
        // That is deadlock 死锁
        
        
        // Dispatch asynchronously to move work off the main thread.
        // and handle the result and a completion handler, not right after dispatching.
        
        
        // Use synchronous dispatch to control access
        // to a shared resource.
        
        
        // Use the global concurrent queues
        // matching the quality of service to the task.
        // and never dispatch synchronously from the main thread.
        
        print("valueR: \(value)")

    }
    
    
}
