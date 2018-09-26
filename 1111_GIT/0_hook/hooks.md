
提交工作流钩子
前四个钩子涉及提交的过程。
=

pre-commit 钩子在键入提交信息前运行。 它用于检查即将提交的快照，例如，检查是否有所遗漏，确保测试运行，以及核查代码。 如果该钩子以非零值退出，Git 将放弃此次提交，不过你可以用 git commit --no-verify 来绕过这个环节。 你可以利用该钩子，来检查代码风格是否一致（运行类似 lint 的程序）、尾随空白字符是否存在（自带的钩子就是这么做的），或新方法的文档是否适当。

prepare-commit-msg 钩子在启动提交信息编辑器之前，默认信息被创建之后运行。 它允许你编辑提交者所看到的默认信息。 该钩子接收一些选项：存有当前提交信息的文件的路径、提交类型和修补提交的提交的 SHA-1 校验。 它对一般的提交来说并没有什么用；然而对那些会自动产生默认信息的提交，如提交信息模板、合并提交、压缩提交和修订提交等非常实用。 你可以结合提交模板来使用它，动态地插入信息。

commit-msg 钩子接收一个参数，此参数即上文提到的，存有当前提交信息的临时文件的路径。 如果该钩子脚本以非零值退出，Git 将放弃提交，因此，可以用来在提交通过前验证项目状态或提交信息。 在本章的最后一节，我们将展示如何使用该钩子来核对提交信息是否遵循指定的模板。

post-commit 钩子在整个提交过程完成后运行。 它不接收任何参数，但你可以很容易地通过运行 git log -1 HEAD 来获得最后一次的提交信息。 该钩子一般用于通知之类的事情。



<hr>

https://git-scm.com/book/zh/v2/%E8%87%AA%E5%AE%9A%E4%B9%89-Git-Git-%E9%92%A9%E5%AD%90
=

<hr>




<hr>


服务端钩子
=
服务端钩子就是你push之后的事情服务器要运行的脚步，有用推的步骤只有一个，所以钩子只有四个

pre-receive 接受之前
update 更新之前
post-update 更新之后
post-receive 接受之后
服务器接收到客户端请求时，pre-receive先进行调用，如果返回值为非0就会拒绝推送，所以我们写钩子的时候一定要记住最后要返回0才能正常接收更新，update主要处理多分支推送，有的时候你一次更新，推三四个分支到服务器，pre-receive只会调用一次，update会对每个的分支调用一次，后面两个都很容易理解

一般我们就是要在服务端更新代码之后运行脚步，所以我们要修改的就是post-update或者post-receive

bash 脚本大家都会写，但是大家可能会很陌生什么是Git服务端，接下来我们就来介绍一下Git服务端是什么

<hr>



http://blog.zhanglun.me/2017/11/25/%E5%B7%A7%E7%94%A8Git%E9%92%A9%E5%AD%90/
=