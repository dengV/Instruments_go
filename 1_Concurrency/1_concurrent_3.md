
在 Playgrounds 中， 搞多线程，

To demonstrate asynchronous activity,


we need to keep the playground running,


until the background tasks finish.

<hr>


<hr>
在 Playgrounds 中, 加入这行代码

`PlaygroundPage.current.needIndefiniteExecution = true`


This means the playground will keep running until 
you call 

`PlaygroundPage.current.finishExecution `

down here at the bottom.



<hr>

Other times you can call it at the end
of a completion handler in the playground code.

<hr>


or you can just manually click the stop button.



很好的提示，就是



it is good to know about this in case

you get into a situation where the playground finishes,

before all the tasks complete.


看按钮的情况。

The button would show play
instead of running.

<hr>

Then you can try turning on indefinite execution,
模糊执行


to see if the tasks just need more time to complete.


<hr>


<hr>



### Every task eventually ends up being
executed to a global dispatch queue.





you can dispatch tasks directly 
to a global dispatch queue.






In an app, you might dispatch to the user initiated global queue.
优先级， 挺高的。





 
You reference this with the 
dispatch queue class function global.



<hr>


<hr>




## Global queues are first in first out,

and concurrent.



<hr>



####  Serial versus concurrent tells you

how many tasks a queue can run simultaneously.




If you dispatch tasks to a concurrent queue,
they start in the order they arrived.
任务抵达，就开启。


but since more than one can run at the same time.
they might finish in a different order.
结束的时机，顺序与开始的不一样。


<hr>



<hr>



#### Synchronous versus Asynchronous tells you:


whether the current thread is blocked,
不论当前线程

whether it has to wait for the tasks to complete,



To demonstrate that the current thread
is not blocked.
为了 展示 当前线程 没有阻塞


when you dispatch asynchronously.














