
First, you wanna see everything that is happening
before main ,

### and then you wanna measure what happens
between main and the end of application
did finish launching.





<hr>



<hr>


> main 后，


使用 Time Profiler


看时间线 上的 life cycle

see the
life cycle column in our timeline.

<hr>



So we zoom in a bit.


We see that we actually have a big chunk
for the launching time.




<hr>



<hr>

Instruments 中的 time Profiler ,

要看 life cycle ,

模拟器中看不到， 是不是 需要用 真机。
模拟器的 问题吗 ?




<hr>


就是 CPU Usage
下面 的 Life Cycle.
<hr>


### 在 Call Tree 的 方法 list 中， 查找 这两个 方法，


## 有 配图的


> func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {



> func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool





<hr>



#### So these are our two main methods that happen
during the launch of our app.



找到 重点， 耗时 比较严重的。

<hr>


<hr>




<hr>






神技啊。



在 Xcode 中， Command + Shift + O
> we can just do command shift O , to the open quickly menu.
任意 搜索文件


> 我每次都是 苦逼的 在某个角落， search and list.



<hr>



<hr>




<hr>

