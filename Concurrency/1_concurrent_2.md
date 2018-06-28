
苹果 有文档的

To Apple's rules for quality of service inference and promotion.


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


### Usually, setting or getting a value.



#### Sync is mainly used for thread safety to avoid race conditions.
同步任务操作， 可用于 线程 安全。


<hr>



大多数情况下， 我们都用 Async .




<hr>


Concurrency problems can still occur 
but they are easier to handle 
or predict with queues.




<hr>



<hr>


Use synchronous dispatch with extreme caution.

使用 同步 派发， 特别要 注意。






