https://www.zhihu.com/question/19608612


## 如何在 Mac OS X 下设置 host ？

<hr>

<hr>



# 发布于.{1,20}赞同

## REGEX

<hr>



刚才网上找到一个比较适合小白的办法：（1）点击 Finder，在顶部菜单栏选择“前往”－“前往文件夹”，粘入 “/private/etc/” 这个路径（不带引号）（2）找到 “hosts” 文件，复制一份到桌面。用 Mac OS X 系统自带的文本编辑器就能编辑 hosts 文件。添加好你要访问（或者拦截）的网站相关 hosts 信息后保存，拖回 Finder 里的 /private/etc/ 文件夹下即可。拖回去的时候，Mac 会弹出报警说无法移动项目。点击“认证”按钮然后输入电脑密码即可。发布于 2014-12-21​赞同 65​​5 条评论​分享​收藏​感谢​motta21 人赞同了该回答 编辑文件 /etc/hosts, 需要权限. 比如:$ sudo nano /etc/hosts 发布于 2011-04-22​赞同 21​​2 条评论​分享​收藏​感谢​Shadie在读法语本科学生，Apple Store实习生，求职应届生，平面设计业余爱好者，潮流街牌业余爱好者14 人赞同了该回答terminal 输入 sudo vi /etc/hosts 回车，输入系统密码。修改完毕之后先按“esc”，再输入“:wq”，回车，退出编辑。或者用textmate之类的编辑器，可以在“打开”窗口里面直接浏览隐藏文件，编辑时批量复制、粘贴和删除hosts比较方便。编辑于 2011-07-13​赞同 14​​3 条评论​分享​收藏​感谢​丁文杰登山爱好者,越知越无知。12 人赞同了该回答这样子把，如果楼主对于指令不熟悉，就安装一个chrome浏览器。然后安装一个hostadmin插件。安装好之后，到terminal里面执行一个：sudo chmod og+w /etc/hosts以后就可以直接在hostadmin里面直接编辑hosts文件的内容了。发布于 2013-11-10​赞同 12​​5 条评论​分享​收藏​感谢​luciferde而浮生若梦, 为欢几何6 人赞同了该回答终端这么好用，不知道你们为啥要用软件sudo vim /etc/hosts，然后输入你电脑的密码进入host文件，按i键进入编辑状态，修改host。然后，ESC退出编辑状态，:wq保存并退出vim会用终端以后，有一种打开了新世界大门的感觉，使用习惯以后会停不下来。编辑于 2018-04-28​赞同 6​​1 条评论​分享​收藏​感谢​彭超宇hello world5 人赞同了该回答对于不熟悉 terminal 的用户来说，推荐一个软件----gas mask，简单快速。发布于 2013-11-14​赞同 5​​添加评论​分享​收藏​感谢​尼古丁二世动心忍性5 人赞同了该回答sudo vim /etc/hosts编辑于 2016-03-02​赞同 5​​添加评论​分享​收藏​感谢​澈言写书 / 平面设计 / 前端开发 / 健身爱好者4 人赞同了该回答 先sudo -i临时获取管理员权限，会提示你输入密码，就是启动的密码。然后 vi /etc/hosts前面的vi是编辑器，当然也可以换用其他的，例如上面的nano。/etc/hosts 是hosts内容，编辑完保存就OK。 发布于 2011-07-12​赞同 4​​添加评论​分享​收藏​感谢​Leo Liang理工男 软件开发 长跑 摄影 户外3 人赞同了该回答Helm - hosts 文件管理：在 Mac App Store 上的内容<img src="https://pic2.zhimg.com/v2-ff6a52de1405314c93f09450601afeed_b.jpg" data-rawwidth="800" data-rawheight="500" class="origin_image zh-lightbox-thumb" width="800" data-original="https://pic2.zhimg.com/v2-ff6a52de1405314c93f09450601afeed_r.jpg">编辑于 2017-04-01​赞同 3​​添加评论​分享​收藏​感谢​leon-ready2 人赞同了该回答题主如果是想切host查看网页的话，推荐下我的小工具，尤其是对开发来说，非常方便！因为我采用了一个沙箱机制，切host只对单个浏览器进程生效，不仅不需要考虑 dns 缓存， 实时生效，而且还可以轻松实现两个页面，一个用host，一个不用host的对比效果~下载地址： http://yun.baidu.com/s/1hrv34wc项目地址：GitHub - liyangready/multiple-host: 虚拟host解决方案，轻松实现两套host环境发布于 2016-02-24​赞同 2​​1 条评论​分享​收藏​感谢​晓鹏程序猿1 人赞同了该回答在选择文件的对话框，Command+shift+G<img src="https://pic1.zhimg.com/v2-1b7323a2f20c7c14ede136b66b9bf7c8_b.jpg" data-caption="" data-size="normal" data-rawwidth="850" data-rawheight="266" class="origin_image zh-lightbox-thumb" width="850" data-original="https://pic1.zhimg.com/v2-1b7323a2f20c7c14ede136b66b9bf7c8_r.jpg">编辑于 2018-04-26​赞同 1​​添加评论​分享​收藏​感谢​茄子康1 人赞同了该回答直接下载个iHosts, app store里面搜索即可，传送门在这儿=> Mac App Store 上的“iHosts - 编辑神器”​itunes.apple.com刚使用mac，看到其他同事都在使用这个软件，自己请教并摸索出来的，哈哈。软件的使用还是很简单直接的，这儿就不贴图了。参考介绍链接：iHosts \u002D 修改神器 (Mac) - V2EX发布于 2018-04-04​赞同 1​​添加评论​分享​收藏​感谢​煮石散人不登山，也不送外卖，爱看电视，总忘带牙刷1 人赞同了该回答Hosts for mac http://pan.baidu.com/s/1mgxRl6S.pkg 文件。可视化操作，十分简单。编辑于 2016-10-19​赞同 1​​3 条评论​分享​收藏​感谢​yu li1 人赞同了该回答有个叫hosts的软件发布于 2014-04-09​赞同 1​​添加评论​分享​收藏​感谢​space yuanIT解决方案顾问，独立软件开发，口琴爱好者泻药  sudo vi /etc/hosts编辑于 2018-05-01​赞同 ​​添加评论​分享​收藏​感谢​匿名用户#!/bin/shcd /tmpcurl "https://raw.githubusercontent.com/racaljk/hosts/master/hosts" -o "googlehosts.temp"cat googlehosts.temp >> hosts.tempsudo cp hosts.temp /etc/hostsrm *.tempecho "Succed..."存为xxxx.sh，chmod+x,执行，不谢发布于 2016-02-24​赞同 ​​添加评论​分享​收藏​感谢​梓姵科技爱好者sudo vi /etc/hostsorsudo vim /etc/hostsorsudo nano /etc/hosts取决于你会用 vi、vim 还是 nano
