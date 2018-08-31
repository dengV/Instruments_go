
苹果 有文档的

# To Apple's rules for quality of service inference and promotion.


<hr>


最简单的 方式， 
to add tasks to a queue ,
uses this async or sync method
providing the task in a closure.

<hr>


Use the async method to move slow tasks off the main queue.
and to update the UI on the main queue.

### 我经常写的代码， 现在明白是什么意思了。


<hr>

#### 漂亮，


Use the sync method to stop the current thread
until a short but critical task completes on another queue.


<hr>


```


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





```


### 我对锁机制的理解

<hr>





### Usually, setting or getting a value.



#### Sync is mainly used for thread safety to avoid race conditions.
同步任务操作， 可用于 线程 安全。


<hr>



大多数情况下， 我们都用 Async .




<hr>


Concurrency problems can still occur 
but they are easier to handle 
or predict with queues.

搞并发， 用队列，就简单多了。


<hr>



<hr>


Use synchronous dispatch with extreme caution.

使用 同步 派发， 特别要 注意。


It blocks the current queue.
## 他会阻塞当前队列。

使用 Sync 干一些轻量级的活，简单的事情，可以用 Sync.
重的事情， 不要同步阻塞。


<hr>

If you task requires access to the current queue.
then your app will deadlock.

## 死锁



### Never dispatch synchronously onto the cucurrent queue.

不要 在当前线程上， 搞同步，

it will deadlock.

<hr>


If it is the current queue,
and never call sync from the main queue.


This can not be said too often.


Blocking the main queue, stops your apps UI from responding to the user.
很差的用户体验。
which is a very bad user experience.


<hr>

<hr>

A interesting implementation detail,


is that a task dispatch synchronously
任务的同步派发，

actually runs on the current thread,

## 线程级别上

### regardless of which queue you dispatched it to.

在当前线程上运行，不论你把它派发的队列

<hr>




Because the current queue has to wait for the task to return.

因为当前线程， 必须等待任务返回。

So its thread won't do anything.


So it might as well do the task.


This has implications if a task has code that checks whether the current queue is the main queue.
or code that checks whether the current thread is the main thread.
这就隐含
如果任务中，包含检查代码
检查当前的线程和队列



<hr>

<hr>


## The main queue always uses the main thread.


But if you dispatch synchronously from the main queue,
但是 如果你在主队列中， 同步派发

which you should never do in any app,

the task actually runs on the main thread.




<hr>

<hr>


## 解决疑惑，一部分

So no, 
it is not running on the main queue,

but yes, 
it is running on the main thread.





## 精彩






