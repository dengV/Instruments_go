
```
dengjiangzhou@dengjiangzhou  ~/Documents/Alpha/ZZTExpres   performance_dengjiangzhou ●  git checkout -- .
```



注意啊， bare double dash 后面 有一个 dot

<hr>



<hr>





[git如何删除本地所有未提交的更改](https://www.v2ex.com/t/66718)





[git checkout — . vs git checkout [duplicate]
](https://stackoverflow.com/questions/41101998/git-checkout-vs-git-checkout)





[git 强制放弃本地修改（新增、删除文件）](https://blog.csdn.net/u012672646/article/details/56676804)





<hr>



<hr>




<hr>



<hr>



```
I seem to recall that the -- is a way to tell Git to treat what follows checkout as a file and not as a branch. Suppose that you had both a file and a branch called stuff. Then the following command would seem ambiguous:

git checkout stuff
because it is not clear whether you are asking to checkout a file or a branch. By using -- you explicitly tell Git to checkout a file by that name/path. So in this case the following commands allow checking out a branch and a file called stuff:

git checkout stuff       # checkout the branch stuff
git checkout -- stuff    # checkout the file stuff
Note that git checkout <name> is really meant for branches, but Git syntax is relaxed, and if Git can't find a branch, then it will look for a file.

Closely related: Git change branch when file of same name is present
```


<hr>


```
本地修改了一些文件，其中包含修改、新增、删除的，不需要了想要丢弃，于是做了git check -- .操作，但是只放弃了修改的文件，新增和删除的仍然没有恢复，于是百度了下，使用如下命令：

git checkout . && git clean -df

可以放弃所有修改、新增、删除文件

git checkout . //放弃本地修改，没有提交的可以回到未修改前版本

git clean是从工作目录中移除没有track的文件.
通常的参数是git clean -df:
-d表示同时移除目录,-f表示force,因为在git的配置文件中, clean.requireForce=true,如果不加-f,clean将会拒绝执行.

```
