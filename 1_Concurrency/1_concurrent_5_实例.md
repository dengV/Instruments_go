
```
func comeAConcurrency(){
    let interval = duration {
        userQueue.async {
            self.taskOne()
        }


        userQueue.async {
            self.taskTwo()
        }

    }
// interval : 4.99486923217773e-05
// You know task one takes
// at least one second,
// but the duration is much, much less.
// 原因如下，
// Because the current thread was not blocked by the tasks.
// it just returned as soon as it finished dispatching the task off to the queue.
// 精彩的 答疑

    print("interval : \(interval)")
}

```



```

Task 2 started
Task 1 started
interval : 3.91006469726562e-05
Task 2 finished
Task 1 finished
```




<hr>


<hr>

同步派发 task one,



### 结果是
task two does not start until task one finishes,







## 原因是
Dispatching synchronously to the user queue,
blocked the current thread until task one finished.

同步执行，立即阻塞当前线程


and it could not dispatch task two,
until task one finished.


#### 结果继续
and the duration is just over a second.

because it could not dispatch task two until task one had finished and returned.
until task one had finished and returned.

and task one takes at least a second.


所以呢， 两个任务派发， 耗时大于 1 秒。
```
func comeAConcurrency(){
    let interval = duration {
        userQueue.sync {
            self.taskOne()
            }


        userQueue.async {
            self.taskTwo()
        }

    }


    print("interval : \(interval)")
}

```



```
Task 1 started

<flash>

Task 1 finished
Task 2 started
Task 2 finished
interval : 1.0017009973526


```


<hr>


<hr>


## 来一个等价


```
func comeASecondConcurrency(){




    let startTime = Date()

    userQueue.sync {
        self.taskOne()
    }


    userQueue.async {
        self.taskTwo()
    }
    let interval = Date().timeIntervalSince(startTime)


    print("interval : \(interval)")
}






```





## 问题， currentThread 是不是全局唯一。 如果是， currentThread 就是主线程了。 




结果确实是很神奇，
没有调用主队列，
使用了主线程。

```

Task 1 started
Task 1 finished
Task 2 started
Task 2 finished
interval : 1.02915298938751

```
