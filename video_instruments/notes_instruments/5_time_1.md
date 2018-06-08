


### Pods 里面:

## target 里面， 动态库 的 图标， 都是 棕色的 文件夹。


## target 里面， 静态库 的 图标， 都是 白色的 石柱宫殿。





<hr>


<hr>




再 podfile 里面， 注释 use framework
就好了， 就是这么的简单


<hr>




> 卧槽， 掌 palm 项目， 全用 静态库， 还这么卡， 我晕



<hr>


<hr>




* cd 到 dist 文件夹

* open .
打开当前文件夹


* 把三个文件 move to trash
kill the workspace , pods , and Podfile.lock


<hr>


<hr>


在 Podfile 里面，


// # use_frameworks!
注释 上面这一行。


<hr>

<hr>
use_frameworks!

这一行 的意思是，

we see we have use frameworks turned on.

So just make sure that these are all installed as

dynamic frameworks.

<hr>

<hr>


然后 pod install




