# https://www.cnblogs.com/hustskyking/p/hosts-modify.html



<hr>


修改Hosts为何不生效，是DNS缓存？


<hr>



Update:

如果浏览器使用了代理工具，修改 Hosts 也不会生效。这里是因为，浏览器会优先考虑代理工具（如添加 pac 文件、SwitchySharp等）的代理，建议调试的时候先关闭这些代理。
使用 pac 文件代理有的时候部分文件的代理不生效，应该是 pac 对应的代理服务器上，做了部分处理。
部分浏览器也有 DNS 缓存，如 chrome(chrome://dns)，这是为什么重启浏览器也不生效的原因，一般设定时间为 60s (如 Firefox)。
浏览器有DNS缓存，系统也会存在 DNS 缓存，有的时候即便在 chrome://dns 清空了浏览器 DNS 缓存，依然不生效，是因为系统 DNS 缓存还未刷新，刷新方式可以看这篇文章。
相信很多同学都在使用 SwitchHosts/iHosts/Gas Mask 等 Hosts 管理工具，当然也有人直接修改 /etc/hosts 或者 system32/drivers/etc/hosts 文件，而经常遇到的疑问是：咿，刚才不是修改并且保存了么，为何 Chrome 浏览器还不生效呢？

有人说重启下浏览器就好了，
有人说清空下缓存 DNS（chrome://net-internals/#DNS）就好了，
有人说隐私模式下打开就好了，
有人说等一分钟吧...
结果就是，进入隐私模式的都好了，重启、清空缓存DNS和等一分钟的同学还在继续纠结中。。。

上面提到的三个工具，SwitchHosts/iHosts/Gas Mask，其实也只有 iHosts 生效了(Mac下)。

开发过程中我们会无数次的切换 Hosts，如果不知道原理，我们在测试的时候还是很心惊胆战的=_=||

修改Hosts不生效的根本原因
因为服务器设置了 keep-alive ！次要原因是存在浏览器 DNS 缓存和系统 DNS 缓存。

> Keep-alive 相关文档

服务器在响应头设置了 Connection: keep-alive （一般的网页都会设置 keep-alive，保持长连接，避免多次连接产生网络消耗）之后，客户端会跟服务器保持长连接，只要长连接不断开，页面在请求的时候就不会重新解析域名！

我们可以这样来测试：

打开一个你至少两分钟没有打开的浏览器（你也可以关闭掉你的浏览器，然后重新打开，记得把所有的 tab 都关了，除了当前 tab ^_^）
在 hosts 添加 127.0.0.1 www.taobao.com
新开 tab，打开 www.taobao.com，是不是进不去了 <这里说明 hosts 修改生效了>
注释掉刚才hosts修改，# 127.0.0.1 www.taobao.com ，再打开 www.taobao.com，很好，正常打开了 <这里说明 hosts 修改也生效了>
去掉注释符，127.0.0.1 www.taobao.com ，再打开 www.taobao.com，依然可以访问！！！
Chrome 中进入 chrome://net-internals/#sockets，，可以看到淘宝首页中很多域名都是与服务器保持着长连接，点击上方的 close idle sockets 按钮，可以关闭所有的长连接
此时，再去访问 www.taobao.com，是不是进不去了！
为何一些修改可以让 “Hosts 生效”
1. 重启浏览器
重启浏览器之后，所有的连接（包括长连接）都会断开，自然就生效了

2. 隐私模式打开
因为隐私模式下不会复用 TCP 连接，新开连接的时候，会重新解析 DNS 域名，自然也生效了

3. iHosts 管理器在 Mac 下生效
因为我在 Windows 下测试过，貌似没有立即生效。问了 iHosts 的作者@必隆，他告诉我，在修改 hosts 文件的时候，会重启网络服务，这个时候必然会断开所有的 TCP 连接（重启网络服务，差不多相当于先断网再联网...)

4. 修改之后，等一会儿...
“等一会儿”，要稍微等久一点，keep-alive 的默认设置是 120s，开发者也有可能增大或者减小这个配置，所以“等一会儿”也是很伤神的=。 =

看到这里，你对其中的原理是否有所了解了呢？
