

mian() 函数前的 时间，


### 使用环境变量


> dyload print statistics

<hr>

### print out the pre-main time


<hr>

## the main bottle neck
is the dynamic library loading time .


<hr>


> Pods 里面 ， 有很多 动态库啊， 不好


<hr>


<hr>


As you can see, now we have a pods target in our app.
So it seems like somebody added a bunch of libraries
to our app, so if we go to the pods target,
有很多 三方库，

and they are all set up
as dynamic libraries, so let us just run and test this
a few more times , get a few warm launches.




<hr>


<hr>




为了 解决瓶颈

> So to fix this , we could just switch these all out
> for static libraries.

需要 改动态库为 静态库。


幸运的是

> CocoaPods makes this pretty easy
as long as all of these libraries are in Objective-C
and not Swift,  they can be installed as static libraries.




The only downside of CocoaPods is it is kind of
all or noting, right,

关于 CocoaPods 唯一不好的方面:

If you wanna use dynamic libraries , then all of your targets
will be dynamic libraries .
Otherwise if you wanna use static,
they will all be static.
要么 全用动态库， 要么全用 静态库。





So let us go ahead and try and install these as static




