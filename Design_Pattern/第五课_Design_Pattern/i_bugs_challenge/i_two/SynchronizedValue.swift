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
    
    // MARK: - Properties
    private let queue = DispatchQueue(label: "SynchronizedValue(\(type(of: ValueType.self))",  attributes: .concurrent)
    // 这条队列 是 并发的
    
    
    
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
        }
        return value
    }
    
    public func set(_ closure: ( inout ValueType ) -> ()){
        queue.sync(flags: DispatchWorkItemFlags.barrier) {
            closure( &backingValue )
        }
        // 卧槽， 并发队列， 同步等待
    }
    
    
    public var unsafeValue: ValueType{
        get {   return backingValue   }
        set {   backingValue = newValue     }
    }
    
    // 外部 接口 调用
    public func setUnsafeValue(_ closure: (inout ValueType) -> () ){
        closure( &backingValue )
    }
    
    
}























