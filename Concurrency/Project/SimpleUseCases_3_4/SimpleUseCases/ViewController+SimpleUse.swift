//
//  ViewController+SimpleUse.swift
//  SimpleUseCases
//
//  Created by dengjiangzhou on 2018/7/15.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import Foundation



extension ViewController{
    
    
    
    func simple_use_cases(){
        
        /*     asyncAdd((2, 2), runQueue: userQueue, completionQueue: defaultQueue) { (result: Int, err: Error?) in
         print(result)
         }
         */
        
        
        
        /*    privateQueue.async {
         let tasks = Code_ToLive()
         
         let out0 = tasks.task0()
         let out1 = tasks.task1(inString: out0)
         let out2 = tasks.task2(inString: out1)
         print(out2)
         }*/
        
        code_random_sleep()
        
    }
    
    
    
    
    func randomTask(_ value: Int) {
        let sleepTime = arc4random_uniform(sleepMax)
        sleep(sleepTime)
        print(String(value) + " slept for " + String(sleepTime))
        // Here is a random task function.
        // It generates a random sleep time between 0 and 4 seconds,
        // sleep , 并打印信息
    }
    
    
    
    func code_random_sleep(){
        
        
        
        print("=== Starting concurrent queue of tasks ===")
        let values = [Int](1...12)
        // TODO: Loop over values to dispatch randomTasks on defaultQueue
        for value in values {
            print("Dispatching \(value)")
            privateQueue.async {
                self.randomTask(value)
            }
            
        }
        // Dispatch a random task for each value in values,
        // to the default global queue.
        
        // So the tasks are dispatched in sequential order,
        // 1 到 12
        // but they finish in a different order depending on how long each task sleeps.
        
        
        
    }
    
    
    
    func system_code_two(){
        userQueue.async {
            let tasks = Code_ToLive()
            
            let out0 = tasks.task0()
            let out1 = tasks.task1(inString: out0)
            let out2 = tasks.task2(inString: out1)
            print(out2)
            
            
        }// The statements in the async closure are all synchronous
        // So they execute sequentially even though
        // they are in a concurrent queue.
    }
    
    
    func code_one(){
        userQueue.async {
            let result = self.slowAdd((2, 2))
            print(result)
            
        }
    }
    
    
    func asyncAdd(_ input: (Int, Int), runQueue: DispatchQueue, completionQueue: DispatchQueue, completion: @escaping (Int, Error?) -> ()){
        
        runQueue.async {
            let result = self.slowAdd(input)
            var error: Error?
            error = .none
            // Initialize error in the run queue closure.
            completionQueue.async {
                completion(result, error)
            }
        }
        // Asynchronous functions should always allow for errors,
        // so add an optional error argument to the completion handler
    }
    

    
    
    
    func slowAdd(_ input:(Int, Int))-> Int{
        sleep(1)
        return input.0 + input.1
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
