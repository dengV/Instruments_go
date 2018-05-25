
## main 前

before the main method is even called,


there are four phases,


* Dylid Loading
First we have the time it takes to load dynamic libraries.

第一是 动态库， 加载


* Rebase / Binding
变基 / 绑定

Second, we have rebase and binding time.
the time in this section is directly affected by how many Objective-C classes.
you have in your app.


* Obj-C Setup
Next we have the Objective-C setup time.


> This is not usually goona be the bottle neck
> and it is also impproved automatically by improving
> the rebase and binding section


* initializers
Finally, we have initializer time, which is slowed down
if yopur objective-C classes implement the load method.
or, if you have non-trival C++ constructors.



> non-trival
> 数学上有固定翻译：非平凡（的）。
> 這個詞是日常用詞，和編程沒有直接關係。意思就是「並非小打小鬧的」「有一定分量的」。
> https://www.zhihu.com/question/20681622














