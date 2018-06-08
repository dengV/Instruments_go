
Apple JPEG.

这么念，

Apple JPeg



<hr>


<hr>



just click on the main thread,

右边， 可看见

### this nice Heaviest Stack Trace



<hr>


### 妈妈的， 使用 模拟器， 连 Debug 符号表， 方法名称 ， 都看不清楚
## dSYM , 似乎只对 真机起作用。


> 模拟器， 好伤。







<hr>


> 这一篇，是图片开线程 decode （解码）

<hr>


CA : Transaction



> Core Animation :          Transaction

<hr>

<hr>


选择 线程 Strategy ,  点击 main thread.


<hr>


Take a good look

at what is going on in the main thread.

<hr>

Then zoom in and filter


>
> Find the really big chunks of work ,
>
> zoom in and filter this area.
>



## Find what is under the hood.

<hr>

This: Heavy work , JPeg decode.
<hr>


## WWDC :           Core Animation CA Transactions

> Four phases of a transaction.


### The Apple JPEG image decoding stuff.

And this prepare phase,
This is when image views will decode their jpegs,
in order to be able to display them.


<hr>

well this is just all my compressed jpegs

being uncompressed so they can be displayed.


> The thing about this stack of the CA transaction
> is that it does not necessarily have to happen
> on the main thread


<hr>



You can do this decompreesion asynchrouously.

and this will free up the main thread to handle scrolling.
and stuff like that.

<hr>


So instead of using imageView,

We are gonna go ahead and make our own


asynchrouously imageview.



<hr>




### 500 px , jpeg



<hr>
