//
//  Sorted_array_simple.swift
//  optimization_
//
//  Created by dengjiangzhou on 2018/7/5.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import Foundation



public struct SortedArray_simple<Element: Comparable> : SortedSet,  RandomAccessCollection {
    public typealias Indices = CountableRange<Int>
    
    public subscript(index: Int) -> Element {
        
        return storage[0]
    }
    
    
    public var startIndex: Int {
        return 0
    }
    
    
    public var endIndex: Int {
        return 1
    }
    
    public func index(of element: Element) -> Int? {
        
        return 0
        
    }
    
    func index(for element: Element) -> Int {
        
        return 0
    }
    
    var storage: [Element] = []
    
    public init(){}
    
    
    
    public func contains(_ element: Element) -> Bool {
        return true
    }
    
    
    
    public func insert(_ newElement: Element) -> (inserted: Bool, memberAfterInserted: Element) {
        return (true, newElement)
    }
    
    
//    public func forEach(_ body: (Element) throws -> Void) rethrows {
//        try storage.forEach(body)
//    }
   
}



// 关键 是 这条协议

// RandomAccessCollection

// 实现了 这条协议 的 方法 ，就不用实现
// BidirectionalCollection 双向 集合类型 的 协议方法
// index(before:) method  
