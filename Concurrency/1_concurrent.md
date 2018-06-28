
### 结论是， 并发 不是 异步 


You can run a task asynchronously on a serial or concurrent queue .


<hr>

Synchronous versus Asynchronous tells you
whether the current queue has to wait for the task to complete.
异步 与 同步，
就是 当前队列 是否 要等待 任务 跑完

<hr>


Serial versus concurrent tells you

whether a queue has one or many threads.
串行 与 并行， 就是 一条队列 的 线程数量 是 1， 还是 多。


This is whether it can run only one
or many tasks simultaneously.

队列的 线程数量， 就决定了 能不能 同时 开启 多个任务。

<hr>


## Sync versus Async 
is about the source of the task.

同步 和 异步， 是 任务 自己的 属性， 是任务 的来处。


## Serial versus concurrent
is about the destination of the task.

串行 和 并行， 是任务的 去处。
队列 怎么 安排 任务的 完成。
拿什么安排？
拿 队列的 线程 数量。


<hr>

<hr>

### GCD

Grand Central Dispatch is Apple's cathy name
for the underlying libdispatch C library.


<hr>

<hr>

GCD provides five global queues.
as well as the main queue . the UI.




<hr>


The main queue is serial with only one thread.

So often , it is also referred to as the main thread.


<hr>


GCD queues are first in first out.


GCD queue ，就是 队列的 意思。


where out means start ,
## Tasks start in the order they arrive.


<hr>

#### The non-main global queues are concurrent.


They create and manage multiple threads to run tasks.




If you run a task synchronously on a concurrent queue,
it can continue working on other tasks on it's other threads.
### 这句话好。
如果 一个 并行队列 的一个任务， 是 同步的。
他的 其他 线程上， 还可以 跑任务。

<hr>


//  原来 一个队列 里面 ， 可以有多个 线程。

//  我的基础 薄弱啊   




<hr>


If another task arrives,
it just creates another thread for that task ,
or queues it onto an existing thread.


<hr>


So taks on concurrent queues 
can finish in a different order than they started.

并发队列上的 一些任务，
任务的 完成 顺序， 与 开始 顺序， 无 必然相关。
任务的 开始 顺序， 不能决定 任务的完成 顺序。
<hr>
<hr>



The main queue is used so often for UI updates.

这是个特殊的类属性， `DispatchQueue.main`


<hr>


If you run a task synchronously on the main queue ,

it can not do anything else,
until that task finishes.




The UI stops responding to the user.
### Always call non-UI tasks asynchronously from the main queue .


# 串行队列 的 异步， 不需要等待， 
# 拿什么？

一个 线程 跑任务，
他没有 其他线程了。


怎么搞的呢？

