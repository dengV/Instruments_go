
###  objects of different types that are hanging around in memory


> This time around, you won’t be using generation analysis. Instead, you’ll look at the number of objects of different types that are hanging around in memory. Click the Record button to start this run. You should already see a huge number of objects filling up the detail panel – too much to look through! To help narrow down only the objects of interest, type “Instruments” as a filter in the field in the bottom-left corner.





<hr>

<hr>



###  # Persistent

> The two columns worth noting in Instruments are # Persistent and # Transient. The Persistent column keeps a count of the number of objects of each type that currently exist in memory. The Transient column shows the number of objects that have existed but have since been deallocated. Persistent objects are using up memory, transient objects have had their memory released.




<hr>

<hr>





### the Visual Memory Debugger

Your main clue in this situation is that not only is the SearchResultsViewController persisting, but so are all the SearchResultsCollectionViewCells. It’s likely that the reference cycle is between these two classes.

> Thankfully, the Visual Memory Debugger, introduced in Xcode 8, is a neat tool that can help you further diagnose memory leaks and retain cycles. The Visual Memory Debugger is not part of Xcode’s Instrument’s suite but is nevertheless such a useful tool that it’s worth including in this tutorial. Cross-referencing insights from both the Allocations instrument and the Visual Memory Debugger is a powerful technique that can make your debugging workflow a lot more effective.
