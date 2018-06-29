//
//  main.swift
//  MulticastClosureDelegate
//
//  Created by dengjiangzhou on 2018/6/10.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import Foundation

/*
 Multicast Closure Delegate Pattern <
 
 
 
 
 
 
 
 Delegate Pattern:
 
 The delegate pattern uses a delegating
 or sending object,
a delegate protocol,
 and also a delegate object that implements the protocol
 
 Whenever something delegate-worthy happens,
  the sender sends a message to the delegate,
 This is a fancy way of saying that,
 it calls a method on the delegate.
 
 However, it is fun to think of this as the sender
 launching a rocket into its delegate.
 
 
 
 
 
 
 The multicast Delegate Pattern:
 is a spinoff pattern from delegate Pattern.
 Instead of just one delegate, however, it has many.
 
  Whenever something delegate-worthy happens,
 it notifies all of its delegates.
 
 
 
 
 
 
 Multicast Closure Delegate Pattern:
  is a spinoff pattern from The multicast Delegate Pattern
 it uses a multicast closure delegate instance,
 which accepts clousres instead of requiring delegates.
 
 用匿名函数， 取代函数
 用变量， 代替方法
 
 // 好像 感觉的， 不准
 
 
 to confrom to a delegate protocol
 
 
 Multicast Closure Delegate Pattern 优点:
 u may be wondering, why are the delegates
 required at all in Multicast Closure Delegate Pattern
 accepts closures?
 为什么协议方法要接收闭包
 
 
 Instead of being called directly,
 the delegates will be used indirectly,
 to keeo the closures strongly referenced.

 
 
*/



let multicastDelegate = MulticastClosureDelegate<Success, Failure>()
let delegate = NSObject()
// delegate , 作为 key


multicastDelegate.addClosurePair(delegate, success: {
    print("Success")
}) {
    print("Failure")
}


/*
 
例子一
 
let callback = multicastDelegate.mapTable.object(forKey: delegate)?.firstObject as! MulticastClosureDelegate<Success, Failure>.CallBack
//  to get the success closure, we have to go through
//  a bit of hoops , jumping through the map table
//  to get its first object, and then casting it to the correct type.
//  投篮命中， 按键取值， 再来个 强制转型
*/



let callback = multicastDelegate.getCallBacks(removeAfter: false).first!


let success = callback.success


success()


print("\n\n")



let (successClosure, successQueue) = multicastDelegate.getSuccessTuples(removeAfter: false).first!


successClosure()

let (failureClosure, failureQueue) = multicastDelegate.getFailureTuples(removeAfter: false).first!

failureClosure()


print(multicastDelegate.count)




















