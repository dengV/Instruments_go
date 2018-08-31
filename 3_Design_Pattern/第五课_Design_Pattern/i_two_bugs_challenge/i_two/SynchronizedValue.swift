//
//  SynchronizedValue.swift
//  i_two
//
//  Created by dengjiangzhou on 2018/6/15.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//


// https://en.wikipedia.org/wiki/Readers–writer_lock


import Foundation


// 使用 GCD 实现 读写锁


public class SynchronizedValue< ValueType: Any > {
    //卧槽，使用了 泛型， ValueType: Any ， 不是 字典， 是 元素 继承于 Any
    
    
    
    // MARK: - Properties
    private let queue = DispatchQueue(label: "SynchronizedValue(\(type(of: ValueType.self))",  attributes: .concurrent)
    
    
    // 这个是 包裹好的， 实际的 值
    private var backingValue: ValueType
    
    
    
    // MARK: - Object Lifecycle
    // MARK: - Object init
    public init(_ value: ValueType) {
        self.backingValue = value
    }
    
    
    
    
    // MARK: - Safe Accessors
    public func get() -> ValueType{
        var value: ValueType!
        queue.sync {
            value = backingValue
        }// 只有这个队列，才可以获取这个值
        return value
    }
    //   queue.sync { ,  线程 安全 的 同步机制
    
    
    
    public func set(_ closure: ( inout ValueType ) -> ()){
        //      closure
        //      ( inout ValueType ) -> ()
        
        queue.sync(flags: DispatchWorkItemFlags.barrier) {
            // 来一个 篱笆， 屏障
            closure( &backingValue )
        }  // 只有这个队列，才可以改这个值
    }
    
    
    
    // MARK: - Unsafe Accessors
    
    public var unsafeValue: ValueType{
        
        get {   return backingValue   }
        set {   backingValue = newValue     }
        
    }
    // 外部 接口 调用
    
    
    public func setUnsafeValue(_ closure: (inout ValueType) -> () ){
        closure( &backingValue )
    }
    
    
}























