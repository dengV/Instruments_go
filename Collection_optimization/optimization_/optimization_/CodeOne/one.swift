//
//  one.swift
//  optimization_
//
//  Created by dengjiangzhou on 2018/7/4.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import Foundation



extension Sequence{
    
    public func shuffled() -> [Iterator.Element]{
        var contents = Array(self)
        for i in 0..<contents.count{
            
            let j = Int(arc4random_uniform(UInt32(contents.count)))
            if i != j{
                contents.swapAt(i, j)
                
                //  Overlapping accesses to 'contents', but modification requires exclusive access; consider calling MutableCollection.swapAt(_:_:)
                //  Replace 'swap(&contents[i], &contents[j])' with 'contents.swapAt(i, j)'
                //  swap(&contents[i], &contents[j])
            }
            
        }
        return contents
    }
    
    
    
}




public protocol SortedSet_Complete: BidirectionalCollection, SetAlgebra{
    //  associatedtype Element: Comparable
    
    
    //  Redeclaration of associated type 'Element' from protocol 'SetAlgebra' is better expressed as a 'where' clause on the protocol
    /*
     Replace '{
     associatedtype Element: Comparable' with ' where Element: Comparable{
     '
     */
}



public protocol SortedSet: BidirectionalCollection, CustomStringConvertible where Element : Comparable{
    
    
    
    init()
    
    func contains(_ element: Element) -> Bool
    
    
    mutating func insert(_ newElement: Element) -> (inserted: Bool, memberAfterInserted: Element)
    
    
}


//  CustomPlaygroundDisplayConvertible



extension SortedSet{
    public var description: String{
        let contents = self.lazy.map{ "\($0)"  }.joined(separator: ",")
        return "[\(contents)]"
    }
}
    
















