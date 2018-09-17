
一、命名管道（FIFO）
=

匿名管道应用的一个限制就是只能在具有共同祖先（具有亲缘关系）的进程间通信。
如果我们想在不相关的进程之间交换数据，可以使用FIFO文件来做这项工作，它经常被称为命名管道。

命名管道可以从命令行上创建，命令行方法是使用下面这个命令：

    $ mkfifo filename

命名管道也可以从程序里创建，相关函数有：

    int mkfifo(const char *filename,mode_t mode);



二、命名管道和匿名管道
=

匿名管道由pipe函数创建并打开。
命名管道由mkfifo函数创建，打开用open。
FIFO（命名管道）与pipe（匿名管道）之间唯一的区别在它们创建与打开的方式不同，这些工作完成之后，它们具有相同的语义。

The  only difference between pipes and FIFOs is the manner in which they are created and opened.  Once these tasks have been accomplished, I/O on pipes and FIFOs has exactly the same semantics.






三、命名管道的打开规则
=

如果当前打开操作是为读而打开FIFO时
O_NONBLOCK disable：阻塞直到有相应进程为写而打开该FIFO
O_NONBLOCK enable：立刻返回成功
如果当前打开操作是为写而打开FIFO时
O_NONBLOCK disable：阻塞直到有相应进程为读而打开该FIFO
O_NONBLOCK enable：立刻返回失败，错误码为ENXIO



<hr>



https://blog.csdn.net/jnu_simba/article/details/8953960
=

