# Instruments_go
学习 iOS 的 instruments

<hr>



<hr>


# ⌘I
<hr>

<h2>  学习资料 </h2>

<div>

<ul>
<li>
<a href="https://www.raywenderlich.com/166125/instruments-tutorial-swift-getting-started"> Instruments Tutorial with Swift: Getting Started</a>
</li>

</ul>

</div>
<hr>
<img src="Images/Memory_Inspector.png">
<center><strong>Memory Inspector</strong></center>


<div>
<table>
<tr>
<th>Time for Profiling</th>
<td>
 Call Tree
</td>
<td>
Symbol Name
</td>
<td>

</td>
<td>

</td>
</tr>

<tr>
<th>Allocation</th>
<td>
 All Heap and Anonymous VM.

</td>
<td>
generation analysis
</td>
<td>
Mark Generation
</td>
</tr>

<tr>
<th>the Visual Memory Debugger</th>
<td>

Malloc Stack 
</td>
<td>

</td>
<td>

</td>
</tr>


</table>
</div>



<hr>

<hr>


<img src="Images/open-in-xcode-button.png">


<hr>

<hr>





### In this tutorial you’re going to learn:

* How to determine hot-spots in your code using the Time Profiler instrument in order to make your code more efficient, and
* How to detect and fix memory management issues such as strong reference cycles in your code using the Allocations instrument and the Visual Memory Debugger.


### Tip One: 

Scan the results to identify which rows have the highest percentage in the Weight column. Notice that the row with the Main Thread is using up a significant proportion of CPU cycles. Unfold this row by clicking the small arrow to the left of the text, and drill down until you see of one of your own methods (marked with the “person” symbol). Although some values may be slightly different, the order of the entries should be similar to the table below:



<hr>





### Tip Two:

Scan the results to identify which rows have the highest percentage in the Weight column. Notice that the row with the Main Thread is using up a significant proportion of CPU cycles. Unfold this row by clicking the small arrow to the left of the text, and drill down until you see of one of your own methods (marked with the “person” symbol). Although some values may be slightly different, the order of the entries should be similar to the table below:

翻译下：在 权重 列 ，降序 排列，百分比 最高的在上面。最上面的 是主线程，unfold 展开。一级一级 往下看。


我注意到： call Tree Symbol 的 第一级 是实际的 方法里。 第二级 就是 调用 上一个方法的代理方法里了。

<hr>



### Tip Two:


Now click the small arrow to the left of the applyTonalFilter row at the top of the table. This will show the caller of applyTonalFilter. You may need to unfold the next row too; when profiling Swift, there will sometimes be duplicate rows in the Call Tree, prefixed with @objc. You’re interested in the first row that’s prefixed with the “person” symbol, which indicates it belongs to your app’s target:


我们关心的 是 Call Tree 中  prefixed with the “person” symbol （就是 前面 带小人图标的）。 影响的（起作用的是）我们写的方法，可以调整的。



<hr>



<hr>


### git 操作：


>  git push git@dengV:dengV/Instruments_go.git
