//
//  main.swift
//  1111
//
//  Created by dengjiangzhou on 2018/7/19.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import Foundation


// question_one()

let key = DispatchSpecificKey<String>()
DispatchQueue.main.setSpecific(key: key, value: "main")

func log(){
    debugPrint("main thread?: \(Thread.isMainThread)")
    let queueValue = DispatchQueue.getSpecific(key: key)
    debugPrint("main queue value exist ?: \(queueValue != nil)")
}

DispatchQueue.global().async {
    DispatchQueue.main.async(execute: log )
}

// dispatchMain()


RunLoop.current.run()
