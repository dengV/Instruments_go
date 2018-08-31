//
//  q_one.swift
//  1111
//
//  Created by dengjiangzhou on 2018/7/19.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import Foundation


func question_one(){
    let key = DispatchSpecificKey<String>()
    
    DispatchQueue.main.setSpecific(key: key, value: "main")
    
    func log(){
        debugPrint("main thread: \(Thread.isMainThread)")
        let queueValue = DispatchQueue.getSpecific(key: key)
        debugPrint("main queue value: \(queueValue != nil)")
        debugPrint("main queue value: not exist? \(queueValue == nil)")
    }
    
    DispatchQueue.global().sync(execute: log)
    RunLoop.current.run()
}



