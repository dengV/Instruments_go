//
//  Sorted_array_progress.swift
//  optimization_
//
//  Created by dengjiangzhou on 2018/7/5.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import Foundation


public struct SortedArray_Progress<Element: Comparable> : SortedSet{
    
    var storage: [Element] = []
    
    public init(){}
    
}



// 针对的是 有序数组
extension SortedArray_Progress{
    func index(for element: Element) -> Int {
        
        var start = 0
        var end = storage.count
        while start<end {
            let middle = start + (end - start)/2
            if element > storage[middle]{
                start = middle + 1
            }
            else {
                end = middle
            }
        }
        return start
    }
    
    
    
    public func index(of element: Element) -> Int? {
        let index = self.index(for: element)
        guard index < count, storage[index ] == element else{
            return nil
        }
        return index
    }
    
    
    
    
    public func contains(_ element: Element) -> Bool {
        let index = self.index(for: element)
        return index < count && storage[index] == element
    }
    
    
    public func forEach(_ body: (Element) throws -> Void) rethrows {
        try storage.forEach(body)
        // 我擦， 递归
    }
    
    
    
    public func sorted() -> [Element] {
        return storage
        // 我擦， 本来就 排好了
    }
    
    
    
    @discardableResult
    public mutating func insert(_ newElement: Element) -> (inserted: Bool, memberAfterInserted: Element) {
        
        let index = self.index(for: newElement)
        if index < count && storage[index] == newElement{
            return (false, newElement)
        }
        storage.insert(newElement, at: index)
        return (true, newElement)
    }
}



extension SortedArray_Progress: RandomAccessCollection{
    
    public typealias Indices = CountableRange<Int>
    
    public var startIndex: Int{
        return storage.startIndex
    }
    
    public var endIndex: Int{
        return storage.endIndex
    }
    
    public subscript(index: Int) -> Element{
        return storage[index]
    }
    
    
}







// 关键 是 这条协议

// RandomAccessCollection

// 实现了 这条协议 的 方法 ，就不用实现
// BidirectionalCollection 双向 集合类型 的 协议方法
// index(before:) method



// Swift 的 协议 满足条件， 自动推导， 自动 infer
// 组合 起来，
// 感觉 挺好的









