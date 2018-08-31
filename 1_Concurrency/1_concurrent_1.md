

You can also create your own private queues.
using the DispatchQueue initializer.

providing a label and optional attributes.

<hr>

A private queue is serial by default,

### Because serial queues are handy for protecting shared resources.

串行队列 对于 共享的 资源， 非常友好。


## 默认就是保护可共享资源的串行队列

<hr>


You can create a private concurrent queue , with the concurrent attribute,


This can be helpful for  debugging.



# and you need one to implement a dispatch barrier.

需要实现 任务的围栏
<hr>

## 有队列，还用什么 协助 程序 ？ 

<hr>


The underlying threads run at different priority level.
下面的一些线程
Which allow the scheduler to prioritize some threads over others.
不同的线程优先级， 便于调度


<hr>


For queues , Apple abstracts thread priority levels to a concept called quality of service,
You specify the purpose of the queue or task,
and let the scheduler decide how to juggle priorities.
让调度 程序，决定怎么 修改 优先级

Each global queue has a different quality of service , represented by the qos enum.





<hr>
<hr>


## .userInteractive 
is for tasks,
the user is directly interacting with,
UI updates , animations, anything needed to keep the UI responsive and fast.

用户响应， 第一
<hr>
<hr>

## .userInitiated 
is for tasks initiated from the UI
that the user needs immediately , but they can be done asynchronously,
Like opening a saved document.

用户 发起， 其次

比如 打开 保存的文件
<hr>
<hr>



## .default
is for work that has no explicit or inferred quality of service.

默认的
<hr>
<hr>


## .utility
is for long running tasks with progress indicators.
Like computations , IO , networking , continuous data feeds.

### The system tries to balance responsiveness and performance with energy efficiency. 

还有， 多功能的

比如， 网络请求，网络 传输
持续的 数据流

<hr>
<hr>


## .background
is for tasks the user is not directly aware of.

后台 操作，
用户 一般 不 是 直接感知的。
用户 无感知的。


They do not require user interaction,
and they are not time sensitive .


> Prefetching , database maintenance,
synchronizing remote servers, backups,



<hr>

backups, （ 备份文件 ）
<hr>




The system focuses on energy efficiency.
系统 专注 电量高效。

u access the global queue using the type method,


`DispatchQueue.global`

providing the appropriate qos constant, 


`DispatchQueue.global` , 不传入参数， 就拿到 default queue.



<hr>
<hr>



The system also infers quality of service level ( Qos ) from that of the current context.
when a task is created or dispatched.
卧槽， 这么看， 系统默认提供的队列， 也可以划入 QoS.


If the current context is the main thread , the inferred quality of service level
is user initiated.




you can specify a quality of service level for a private queue.
but if you add a higher quality of service task,
the queues quality of service will be promoted to match.
给 指定 优先级的 队列， 添加 高优先级 的 任务， 该队列 的 优先级 会提升
### 哇， 升级了



#### and any future tasks will also have
thrie quality of service promoted.


### 竟然有 ， 固化效果

<hr>
<hr>


我回忆起来了，
我初中 升高中，
每天在 大堂里面学习，
右边 悬挂了 一幅 大大的 日历，
我在上面 乱写乱画， 希望这 该死的日子，赶紧过去。
复习时间， 我在看 黄易小说。






# 我的 爹爹婆婆， 谢谢你们
