  // interval : 4.99486923217773e-05
  // You know task one takes
  // at least one second,
  // but the duration is much, much less.
  // 原因如下，
  // Because the current thread was not blocked by the tasks.
  // it just returned as soon as it finished dispatching the task off to the queue.
  // 精彩的 答疑
  
  
  
<hr>

<hr>

Concurrent execution is the default global queue behavior.



The only global serial queue is `DispatchQueue.main`
and that is only for UI activity.



### 系统默认提供的， 五个   Global Queue



<hr>


<hr>


You can create a private serial queue,
if you want tasks to run in the order they arrive.

按照任务抵达的顺序， 执行任务，

and this is useful for insuring serial access to a resource.

### That's avoiding race conditions and deadlocks.
优点来了。


<hr>



You create a private queue with,
the diapatch queue initializer,


## 串行是标配

Serial is the default attribute for a private dispatch queue.


So you only need to specify the queue's label.





```
let dengSerialQueue = DispatchQueue(label: "com.deng.thread.start")
```

<hr>



<hr>

### 至于串行队列


```
let interval = duration {
dengSerialQueue.async {
self.taskOne()
}// now dispatch the tasks onto the queue.


dengSerialQueue.async {
self.taskTwo()
}
// 顺序执行，
// because there is only one thread
// and so task two can not start until task one has finished.

// 串行比并发耗时长一点点
// because for private queues,
// the system has to do some set up and clean up.
// and it needs some time to do that.
// 一些额外的工作，

}// Serial Interval : 5.9962272644043e-05
// 也很快就完成了

```


<hr>



<hr>



So far we have always dispatched tasks asynchronously,
whether the queue is concurrent or serial,


## The async method returns immediately to the current thread.


### 异步方法， 立即返回到他的当前线程。

#### so it can immediately execute the next statement.


<hr>



<hr>



同步队列创建了多个线程，开展工作。



And the serial queue runs the tasks on it's single thread.


<hr>



<hr>












