//
//  Utility.swift
//  Async
//
//  Created by dengjiangzhou on 2018/7/12.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import Foundation


public func duration(_ block: () -> ()) -> TimeInterval{
    let startTime = Date()
    
    block()
    let interval = Date().timeIntervalSince(startTime)
    
    // Date.timeIntervalSince(startTime)
    // 这样就悲剧了
    // Date 后面的括号
    return interval
    
    
}
