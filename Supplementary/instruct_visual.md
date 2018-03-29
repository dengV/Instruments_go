### Getting Visual

Quit the Allocations instrument and exit the Instruments suite.

> Before starting the Visual Memory Debugger, enable Malloc Stack logging in the Xcode scheme editor like this: Click on the Instruments Tutorial scheme at the top of the window (next to the stop button) and select Edit Scheme. In the pop-up that appears, click the Run section and switch to the Diagnostics tab. Check the box that says Malloc Stack and select the Live Allocations Only option and click close.


<hr>

<hr>

<img src="https://github.com/dengV/Instruments_go/blob/master/Images/visual_memory_debugger.png">
<center><strong>Memory Inspector</strong></center>






* Switch to the Debug navigator.


* Click this icon and choose View Memory Graph Hierarchy from the pop up.


* Click on the entry for the SearchResultsCollectionViewCell.


* You can click any object on the graph to view details on the inspectors pane.


* You can view details in this area. Switch to the Memory inspector here.


The Visual Memory Debugger pauses your app and displays a visual representation of objects in memory and the references between them.


As highlighted in the screenshot above, the Visual Memory Debugger displays the following information:


<b>Heap contents (Debug navigator pane):</b> This shows you the list of all types and instances allocated in memory at the moment your app was paused. Clicking on a type unfolds the row to show you the separate instances of the type in memory.


<b>Memory graph (main window):</b> The main window shows a visual representation of objects in memory. The arrows between objects represent the references between them (strong and weak relationships).


<b>Memory Inspector (Utilities pane): </b>This includes details such as the class name and hierarchy, and whether a reference is strong or weak.




<hr>


<hr>



# Retain Cycle



> The closure cell refers to the SearchResultsViewController using self, which creates a strong reference. The closure captures self. Swift actually forces you to explicitly use the word self in closures (whereas you can usually drop it when referring to methods and properties of the current object). This helps you be more aware of the fact you’re capturing it. The SearchResultsViewController also has a strong reference to the cells, via their collection view.

To break a strong reference cycle, you define a capture list as part of the closure’s definition. A capture list can be used to declare instances that are captured by closures as being either weak or unowned:

Weak should be used when the captured reference might become nil in the future. If the object they refer to is deallocated, the reference becomes nil. As such, they are optional types.
Unowned references should be used when the closure and the object it refers to will always have the same lifetime as one another and will be deallocated at the same time. An unowned reference can never become nil.
