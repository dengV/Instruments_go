
## 画面， 卡顿


See some little hiccups as the images come on the screen




<hr>


hiccups:        打嗝


<hr>




<hr>


#### Time Profiler,


the majority of the time.



<hr>







<hr>



> While other tools may give you ,
> a little bit better perspective as to what is causing
>
> a certain problem in your app.
>




<hr>


<hr>




#### Like many of the instruments , Time Profiler uses
#### the powerful DTrace tool under the hood,
to dynamically insert itself into your app.
while it is running.



<hr>


<hr>


```
DTrace is actually a command line tool,
made by Sun Microsystems, to get a detailed overview
of everything going on a running program.


```








<hr>


<hr>






You can even make your own instruments,
by writing custom DTrace scripts.



<hr>



Anyway , Time Profiler works by capturing your app's
call stack at a constant inteval.



<hr>


<hr>



As time moves along , Time Profiler will grab snapshots
of your current call stack, at a constant inteval.



> By default , each of these snapshots will happen
> one millisecond apart.

