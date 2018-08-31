//
//  Concurrency.swift
//  Async
//
//  Created by dengjiangzhou on 2018/7/13.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import Foundation





struct Concurrency_one {
    


    let userQueue = DispatchQueue.global(qos: .userInitiated)
    let defaultQueue = DispatchQueue.global()
    let mainQueue = DispatchQueue.main


    let dengSerialQueue = DispatchQueue(label: "com.deng.thread.start")


    let privateConcurrentQueue = DispatchQueue(label: "com.deng.thread.concurrent", attributes: .concurrent)




    func comeASecondConcurrency(){
        let startTime = Date()
        
        userQueue.async {
            self.taskOne()
        }
        
        /*
         userQueue.sync {
         self.taskOne()
         }
         // 小实验
         */
        
        userQueue.async {
            self.taskTwo()
        }
        let interval = Date().timeIntervalSince(startTime)
        
        
        print("interval : \(interval)")
    }




    func comePrivateConcurrentQueue(){
        
        // Private Concurrent Queue
        
        // you could use this to group tasks triggered by user action.
        // keeping them separate from the global queues.
        
        
        // 可以这么搞
        // need a private concurrent queue to create a dispatch barrier.
        // 这是一种方法 , 解决读写竞争条件
        // That is one solution for the reader / writer race condition problem
        
        let interval = duration {
            privateConcurrentQueue.async {
                self.taskOne()
            }// now dispatch the tasks onto the queue.
            
            
            privateConcurrentQueue.async {
                self.taskTwo()
            }
            
        }
        
        
        
        print("privateConcurrentQueue Interval : \(interval)")
        
        
        
    }





    func comeASerialQueue(){
        let interval = duration {
            dengSerialQueue.async {
                self.taskOne()
            }// now dispatch the tasks onto the queue.
            
            
            dengSerialQueue.async {
                self.taskTwo()
            }
            // 顺序执行，
            // because there is only one thread
            // and so task two can not start until task one has finished.
            
            // 串行比并发耗时长一点点
            // because for private queues,
            // the system has to do some set up and clean up.
            // and it needs some time to do that.
            // 一些额外的工作，
            
        }// Serial Interval : 5.9962272644043e-05
        // 也很快就完成了
        
        
        
        print("Serial Interval : \(interval)")
    }


    func comeAConcurrency(){
        let interval = duration {
            userQueue.sync {
                self.taskOne()
            }
            
            
            /*
             userQueue.sync {
             self.taskOne()
             }
             
             // 实验下
             */
            
            
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

}
