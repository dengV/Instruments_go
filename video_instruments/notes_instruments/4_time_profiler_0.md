
The thing to remember about Time Profiler,

is that it is not actually collecting the duration

of each method your app was calling.


<hr>

<hr>



Instead , it collects these stack traces


and then counts the number of times it sees these methods

in the samples.



<hr>

<hr>





What you are seeing in the output,


is more of an average of how often a particular method

shows up at any given time, when your code is running.




<hr>



This means thar Time Profiler can not actually

tell the difference between large methods

that takes a long time , and short methods

that get called more often.



### 调用时间长的方法， 与频繁调用的执行时间短的方法 对于 Time Profiler 是没有区别的。

> 高频，执行快捷的方法
> 与 执行时间长的方法




> This does means that if the method is short enough,
> and gets called infrequently enough,
> it may not show up at all.









