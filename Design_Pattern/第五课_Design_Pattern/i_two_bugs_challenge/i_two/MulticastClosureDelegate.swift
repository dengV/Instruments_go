//
//  MulticastClosureDelegate.swift
//  MulticastClosureDelegate
//
//  Created by dengjiangzhou on 2018/6/10.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

/*

 import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

 */



import Foundation

// MARK: - MulticastClosureDelegate


// 作为 代理 的虚拟机， 统一调度， 注册与 使用

public class MulticastClosureDelegate<Success, Failure> {
    
    // MARK: - Callback
    class CallBack {
        //  the callback will actually hold onto our closures.
        //  so that we can set this inside of NSMutableArray.
        //  Despite this setback, it is still well worth it
        //  to avoid strongly referencing the delegates.
        //
        
        
        
        let queue: DispatchQueue
        let success: Success
        let failure: Failure
        
        init(queue: DispatchQueue, success: Success, failure: Failure){
            self.queue = queue
            self.success = success
            self.failure = failure
        }
        
        
    }
    
    
    
    // MARK: - Instance Properties
    //  fileprivate var mapTable
    
    
    //  var mapTable = NSMapTable<AnyObject, NSMutableArray>.weakToStrongObjects()
    internal var mapTable = SynchronizedValue(NSMapTable<AnyObject, NSMutableArray>.weakToStrongObjects())
    
    
    
    //  use NSMapTable , to hold onto the object to closure mappings.
    //  An NSMapTable is similar to a plain vanilla swift dictionary.
    //  Both have keys and values.
    //  Unlike a dictionary, an NSTable has a constructor for weakToStrongObjects()
    //  A swift dictionary always strongly references its keys
    //  by using the weakToStrongObjects() , this tells mapTable to weakly reference its keys
    

    //  Now since these keys are actually going to be
    //  delegate objects,
    //  放的 键是， 代理对象
    
    //  we would prefer them to be weakly referenced.
    //  If they are not, we would have to remember to remove or unregister them,
    //  which is easy to forget, and therefore, error prone.
    
    //  Since they are weakly referenced by a mapTable.
    //  they will automatically get removed.
    //  if a delegate ever becomes nil.
    
    //  the one downside is that NSMapTable
    //  requires both keys and values to be objects.
    //  So you must also use an NSMutableArray, instead of a swift array.
    
    
    
    
    
    // MARK: - Instance Methods
    public func addClosurePair(_ objectKey: AnyObject, queue: DispatchQueue = .main, success: Success, failure: Failure ){
        // 增添 闭包 对
        
       /* let callBack = CallBack(queue: queue, success: success, failure: failure)
        let array = mapTable.object(forKey: objectKey) ?? NSMutableArray()
        array.add(callBack)
        mapTable.setObject(array, forKey: objectKey)
        */
        
        
        mapTable.set { mapTable in
            let callBack = CallBack(queue: queue, success: success, failure: failure)
            let array = mapTable.object(forKey: objectKey) ?? NSMutableArray()
            array.add(callBack)
            mapTable.setObject(array, forKey: objectKey)
        }
        
    } // 但从这个方法， 没必要用 NSMutableArray
    //  Next, we will add a method , to actually register closures using this callback.
    //
    
    
    
    
    
    
    
    //  Provides a convenience method to
    //  return all of the callback instances for us.
    //  fileprivate
    func getCallBacks(removeAfter: Bool = true) -> [CallBack]{
        //  removeAfter , 就是 全部删了
        
        /*
        
        let objects = mapTable.keyEnumerator().allObjects as [AnyObject]
        let callbacks: [CallBack] = objects.reduce( [] ) { (combinedArray, objectKey) in
            let array = mapTable.object(forKey: objectKey)! as! [CallBack]
            return combinedArray + array
        } // 感觉 有 flatmap ， 打平 效果
        // This is actually the behavior we want by default.
        // 第一个例子的 ， 业务代码 转移
        
        
        
        //  defer {
            //  return callbacks
        //  } // return' cannot transfer control out of a defer statement
        
        guard removeAfter else {  return callbacks  }
        
        // here we pass removeAfter , to clean up the callbacks by removing them from the map table.
        objects.forEach {    mapTable.removeObject(forKey: $0)
        }
 
 */
        var callBacks: [CallBack]!
        mapTable.set { mapTable in
            // 在外面 加了一层保护
            
            let objects = mapTable.keyEnumerator().allObjects as [AnyObject]
            callBacks = objects.reduce( [] ) { (combinedArray, objectKey) in
                let array = mapTable.object(forKey: objectKey)! as! [CallBack]
                return combinedArray + array
            }
            
            guard removeAfter else {  return  }
            
            // here we pass removeAfter , to clean up the callbacks by removing them from the map table.
            objects.forEach {
                mapTable.removeObject(forKey: $0)
                // 为什么不能， 一下子， remove All Objects?
            }
        }
        
        return callBacks
    }// 把所有的 回调 callbacks , 一次性 取出来
    
    
    
    
    //  Next, we would like to add a method to get the
    //  success tuples which is the success closure
    //  and also the relevent dispatch queue to notify on.
    public func getSuccessTuples( removeAfter: Bool = true ) -> [(Success, DispatchQueue)]{
        
        
        return getCallBacks(removeAfter: removeAfter).map{ (callBack ) -> (Success, DispatchQueue) in
            return (callBack.success, callBack.queue)
            //  return ($0.success, $0.queue)
            // 卧槽， 我一定抄写错了
            // 没写错， 取成功回调， 不需要 failure, 也不可能
        }
        //  here, we simply use the mothod from before,
        //  call map , 建立映射， 发生转换
        //  to transform to the type that we would like , 就是 an array of success tuples.
    }
    
    
    
    // failure 版本
    public func getFailureTuples( removeAfter: Bool = true ) -> [(Failure, DispatchQueue)]{
        //  removeAfter , 区分 只读， 和
        //  读 然后 操作
        
        
        
        return getCallBacks(removeAfter: removeAfter).map{
            return ($0.failure, $0.queue)
        }
        //  here, we simply use the mothod from before,
        //  call map , 建立映射， 发生转换
        //  to transform to the type that we would like , 就是 an array of success tuples.
    }
    
    
    
    // a convinience property
    // to get the count of the callbacks
    
    public var count: Int{
        return getCallBacks(removeAfter: false).count
    }
    
    
    // as this will just be a computed property, 计算属性
}





// MARK: - Testing
typealias Success = () -> Void
typealias Failure = () -> Void


// 尼玛的， 泛型， 还能 这么用 啊



















