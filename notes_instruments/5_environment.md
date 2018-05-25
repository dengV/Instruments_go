

# 我都是 用 模拟器



<hr>

<hr>


## 冷启动， 第一次安装

```

Total pre-main time: 1.4 seconds (100.0%)
dylib loading time: 297.80 milliseconds (20.3%)
rebase/binding time: 757.06 milliseconds (51.6%)
ObjC setup time:  77.85 milliseconds (5.3%)
initializer time: 333.85 milliseconds (22.7%)
slowest intializers :
libSystem.dylib :  16.71 milliseconds (1.1%)
AFNetworking : 118.52 milliseconds (8.0%)
AsyncDisplayKit : 123.51 milliseconds (8.4%)
Catstagram : 180.34 milliseconds (12.2%)

```


<hr>

<hr>

## 热启动， 第二次 跑

```
Total pre-main time: 1.5 seconds (100.0%)
dylib loading time: 577.23 milliseconds (37.2%)
rebase/binding time: 484.80 milliseconds (31.2%)
ObjC setup time: 123.18 milliseconds (7.9%)
initializer time: 365.20 milliseconds (23.5%)
slowest intializers :
libSystem.dylib :   6.20 milliseconds (0.4%)
libMainThreadChecker.dylib :  92.83 milliseconds (5.9%)
AFNetworking :  87.44 milliseconds (5.6%)
AsyncDisplayKit : 147.68 milliseconds (9.5%)
Catstagram : 125.00 milliseconds (8.0%)

```



<hr>

<hr>
