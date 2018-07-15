
## GCD 组管理，

DIscover the power of dispatch groups,


Allowing you to respond to the completion of a group of tasks.


<hr>

A GCD task 
is basically a closure .

一个 GCD 任务，是一个匿名函数。


To get a notification when a single task is completed,
just write it into the end of the task's closure.


### 这就是 CompletionHandler

<hr>


一个任务， 好处理。

一组任务呢？


When a group of tasks has completed.

<hr>


> 一般的状态管理是这么做的，
> 我是这么做的， 很烂的

# You could keep track of the result of each individual task,


and check them off some kind of register when they return,

#### but that is quite a lot of extra work.

## 开始涉及编程 设计思想的本质
#### 为何不 自己搞 一套 封装。
就像苹果惯用的那样。
<hr>


<hr>



GCD provides preciously this functionality
### in a dispatch group.



You can create your own custom dispatch groups,

<hr>


<hr>


举个例子， 

to group all the tasks triggered by user action.


所以呢？

when you use async to dispatch a task onto a queue ,
you can specify a group.


Then you can request to be notified,
that all the tasks in a group are completed.



<hr>


<hr>

```

queue.async(group: group){}



```


实际上，
If you don't specify a group in the async call,
不指定参数的情况下，

## the task goes into the default dispatch group.

No matter which queue you are dispatching onto .


<hr>


那到底 什么是 DisptachGroup 呢？
是建立在 DispatchQueue 上面， 还是下面？

### 我感觉  DisptachGroup 和  DispatchQueue ，就像 线程管理的纵向和横向， 构成了 线程管理的矩阵。

<hr>
<hr>


To run a closure when all the tasks in a group have completed .
Use the `dispatch_group.notify` method.


Giving it a queue, you want the closure to run on. 
and the closure itself. 
给一个方法



<hr>
<hr>


If you need to block the current thread,
until all the tasks in a group have been completed.






使用同步的 `dispatch group wait` 方法，
Use the synchronous dispatch group wait method.


### Be very careful ,  `dispatch group wait` is a synchronous function.


# It is possible to create a deadlock with it.



### Absolutely do not call it on the main queue.










