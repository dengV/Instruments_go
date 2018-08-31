//
//  MulticastClosureDelegate.swift
//  MulticastClosureDelegate
//
//  Created by dengjiangzhou on 2018/6/10.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import Foundation

public class MulticastClosureDelegate<Success, Failure>{
    
    // MARK: - Callback
    class CallBack {
        let queue: DispatchQueue
        let success: Success
        let failure: Failure
        
        init(queue: DispatchQueue, success: Success, failure: Failure){
            self.queue = queue
            self.success = success
            self.failure = failure
        }
    }
    
    
    //  var mapTable = NSMapTable<AnyObject, NSMutableArray>.weakToStrongObjects()
    internal var mapTable = SynchronizedValue(
        NSMapTable<AnyObject, NSMutableArray>.weakToStrongObjects()
    )
    
    
    // MARK: - Instance Methods
    public func addClosurePair(_ objectKey: AnyObject, queue: DispatchQueue = .main, success: Success, failure: Failure ){
        mapTable.set { mapTable in
            let callBack = CallBack(queue: queue, success: success, failure: failure)
            let array = mapTable.object(forKey: objectKey) ?? NSMutableArray()
            array.add(callBack)
            mapTable.setObject(array, forKey: objectKey)
        }
    }

    
    
    func getCallBacks(removeAfter: Bool = true) -> [CallBack]{
        var callBacks: [CallBack]!
        mapTable.set { mapTable in
            let objects = mapTable.keyEnumerator().allObjects as [AnyObject]
            callBacks = objects.reduce( [] ) { (combinedArray, objectKey) in
                let array = mapTable.object(forKey: objectKey)! as! [CallBack]
                return combinedArray + array
            }
            
            guard removeAfter else {  return  }
            objects.forEach {    mapTable.removeObject(forKey: $0)  }
        }
        return callBacks
    }
    
    

    public func getSuccessTuples( removeAfter: Bool = true ) -> [(Success, DispatchQueue)]{
        return getCallBacks(removeAfter: removeAfter).map{ (callBack ) -> (Success, DispatchQueue) in
            return (callBack.success, callBack.queue)
            //  return ($0.success, $0.queue)
        }

    }
    
    
    
    // failure 版本
    public func getFailureTuples( removeAfter: Bool = true ) -> [(Failure, DispatchQueue)]{
        return getCallBacks(removeAfter: removeAfter).map{
            return ($0.failure, $0.queue)
        }
    }
    

    public var count: Int{
        return getCallBacks(removeAfter: false).count
    }
}


// MARK: - Testing
typealias Success = () -> Void
typealias Failure = () -> Void


