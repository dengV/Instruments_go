mysql登录退出命令


    mysql退出三种方法：
    mysql > exit;
    mysql > quit;
    mysql > \q;
    
    
    
    
<hr>


http://www.cnblogs.com/panxuejun/p/6110638.html

<hr>


<hr>


https://blog.csdn.net/tr1912/article/details/77462256

<hr>

字符串问题


# 双引号， 很重要


<hr>



   但是死活就是报如题中的错误，然后找到了解决的方案，原来是我们在代码和sql工具中写sql语句的时候，字符串用‘’就可以被引用，但是在Xshell环境下，并没有这样的环境，Linux的命令中，似乎“”才是引用字符串的王道，所以只需要把我们想要添加的文字替换成用“”包括就可以了。

<hr>




