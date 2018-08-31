
### A crutial element to improve performance in iOS apps
is Focusing on the main thread.


<hr>


主线程，干两件事:

## 接受用户输入，
Taps can be cached by background D , (什么鬼)
and can tolerate a main thread stores of something like
50 to 100 milliseconds before events will be lost.



Continous gestures like swipes are much more sensitive,
and can only tolerate five to 10 milliseconds.



## 主线程， 管 UI

Just as touches can be dropped when the main thread
is unresponsive , the drawing of individual frames
can be lost as well.



The main thread draws at a constant inteval,
where each time to draw is called the v think (这又是 什么鬼)
If the main thread had not finished its work in time,
It will skip drawing that frame.

### 丢帧 ， 出来了


Your main goal with profiling is to get your app running
at 60 frames per second.

保证用户体验流畅





1 秒 60 帧， 等价于
like 16.67 milliseconds for each frame to do its work.
Any big chunk of work that takes more than 60 milliseconds
will almost guarantee an opportunity to draw frame is missed.


ake a frame drop 失帧

### 要避免的

