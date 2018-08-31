
You will probably create custom dispatch groups more often than custom concurrent queues.





Custom groups are a convenient way 
to keep track of related tasks.

<hr>
<hr>


If you want to include an asynchronous function in a dispatch group, 
and that function does not have a dispatch group argument ,
### you can wrap the function to add that argument ,

### 在方法中，添加派发组管理参数， 包进去 

then use the dispatch group `enter` and `leave` methods to mark 
### when the task begins and ends.


<hr>
<hr>


These calls must be balanced, including when handling errors.


<hr>
<hr>



事实上，
Just as there is a default global queue,
there is also a default dispatch group.

队列和组管理， 都是有默认的。

<hr>

A queue's async method actually adds tasks
to the default dispatch group.



你也可以创建自己的组管理，
You can create a custom dispatch group 
to group tasks that are related,
but don't necessarily have the same quality of service value.


<hr>
<hr>



If your app really can't continue,
until the dispatch group finishes,
you can call it's `wait` method. 


`slowGroup.wait(timeout: DispatchTime.distantFuture)`
You want to be really careful using this wait call,
because it is synchronous , 
and it is a synchronous call on the current queue, and it will block the current queue.


## 原因是这样的吗？
You can not have anything in the group,
that wants to use the current queue , or you will get deadlock.


<hr>
<hr>

How can you adapt it , so the group knows when it is really finished?


所以 `enter` and `leave` 

To wrap this async add function.


<hr>








```

func asyncAdd_Group(_ input: (Int, Int), runQueue: DispatchQueue, group: DispatchGroup, completionQueue: DispatchQueue, completion: @escaping (Int, Error?) -> ()){
    group.enter()
    asyncAdd(input, runQueue: runQueue, completionQueue: completionQueue) { (result, error) in
        completion(result, error)
        group.leave()
    }
}
```


## 成对调用，
need to balance this with the async add's `leave ` method,
at the end of the completion handler.




So this balanced pair of enter and leave calls,
tells the dispatch group when this asynchronous function start and when it really finishes.


So when it finishes , the group can check it off it's list of tasks.
`leave` 了， 组管理可以做一些任务检查










<hr>
<hr>



## 这么看，
notify 针对的是一组 task. 
一组任务， 都完成了。



`enter` and `leave`  针对的是一个 task.( 指定的 )



notify , 配合的是 async Group .

<hr>
<hr>


`enter` and `leave`，
不需要 配合 async Group .
