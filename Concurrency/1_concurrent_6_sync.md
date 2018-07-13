 You have to be very careful calling a queues sync method,


because the current thread has to wait until the task finishes running on the queue.
当前线程， 一定会线程等待的



<hr>



and never call sync on the main thread.

because that will almost certainly deadlock your app. 

<hr>


But sync is very useful for avoiding race conditions, 
sync 在避免竞争条件上， 有效果。
if the queue is a serial queue, and it is the only way to access an object.
限制获取资源的途径


<hr>


<hr>



The sync method
behaves like a mutual exclusion lock.

guaranteeing that all threads get consistent values.
保证 所有的线程， 得到同样的结果。

## 这个怎么解释。



<hr>


<hr>


We can create a simple race condition
by changing value asynchronously on  a private queue.
### 写
## (Serial , 我觉得)


while displaying value on the current thread.
### 读



<hr>


<hr>


```
func changeValue(){
    sleep(1)
    value = 0
    print("valueW: \(value)")
}



   

func come_race_condition(){

    dengSerialQueue.async {
        self.changeValue()
    // 再走这里
    }
    // Let's dispatch `changeValue` asynchronously
    // onto our private serial queue.





    // and display value on the current thread.
    print("valueR: \(value)")
    // 先走这里
    // because it executes before `changeValue` finishes.( changing the value )
    
}



```

<hr>


<hr>


 

```



func come_race_condition_two(){

    dengSerialQueue.sync {
        self.changeValue()

    }
    // 阻塞 current thread


    // Dispatching `changeValue` synchronously
    // is going to block the current thread,
    // until the change value task has finished.
    // thus removing that race condition.


    // 现在结果就比较顺序执行了。
    // because it had to wait until the `changeValue` task finished.


    // 请牢记住
    // although an asynchronous call returns right away,
    // we do not know when it's work will actually finish.


    // So we should not try to use it's results immediately after we call it.

    // That is what completionHandlers are for
    // 这就是 completionHandlers 的意义所在


    // A completionHandler runs exactly when
    // the work has completed.
    // usually returning some results and often error or status info as well.

    // 我们就在这里更新 UI
    // So that is where you would update the UI
    // or do what needs doing with the results.

    // and that is also why you never dispatch synchronously from the main thread.

    // Most of the time the task you dispatched will try to update the UI when it is finished.
    // 然后就在主队列刷新

    // if the main queue is waiting for the task to finish,
    // and the task is waiting for the main queue to update the UI.

    // That is deadlock 死锁


    // Dispatch asynchronously to move work off the main thread.
    // and handle the result and a completion handler, not right after dispatching.


    // Use synchronous dispatch to control access
    // to a shared resource.


    // Use the global concurrent queues
    // matching the quality of service to the task.
    // and never dispatch synchronously from the main thread.

    print("valueR: \(value)")

}


```

 
 <hr>
 
 
 <hr>



An app's UI runs in the main queue,
but playgrounds run in the default global queue.











