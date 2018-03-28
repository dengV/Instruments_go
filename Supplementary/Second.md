
# ⌘I

Re-run the app in Instruments by navigating to Product\Profile (or ⌘I – remember, those shortcuts will really save you some time).

> Notice that this time Xcode doesn’t ask you for which instrument to use. This is because you still have a window open for this app, and Instruments assumes you want to run again with the same options.

Perform a few more searches, and notice that this time the UI is not quite so clunky! The image filter is now applied asynchronously and the images are cached in the background, so once they only have to be filtered once. You’ll see a number of dispatch_worker_threads in the Call Tree – these are handling the heavy lifting of applying image filters.






<hr>

<hr>





## Allocations

So what bug are you going to track down next? :]

There’s something hidden in the project that you probably don’t know is there. You’ve likely heard about memory leaks. But what you may not know is that there are actually two kinds of leaks:

* True memory leaks are where an object is no longer referenced by anything but still allocated – that means the memory can never be re-used.
Even with Swift and ARC helping manage memory, the most common kind of memory leak is a retain cycle or strong reference cycle. This is when two objects hold strong references to one another, so that each object keeps the other one from being deallocated. This means that their memory is never released.
不要丢失


* Unbounded memory growth is where memory continues to be allocated and is never given a chance to be deallocated. If this continues forever, then at some point the system’s memory will be filled and you’ll have a big memory problem on your hands. On iOS this means that the app will be killed by the system.
有止



<hr>




## 标记 （ 内存的）Generation 
> What you’re going to perform is a “generation analysis”. To do this, click the button called Mark Generation. You’ll find the button at the bottom of the detail panel:


<hr>

At this point, you should be getting suspicious. Notice how the blue graph is going up with each search that you drill into. Well, that certainly isn’t good. But wait, what about memory warnings? You know about those, right? Memory warnings are iOS’s way of telling an app that things are getting tight in the memory department, and you need to clear out some memory.

It’s possible that this growth is not just due to your app; it could be something in the depths of UIKit that’s holding onto memory. Give the system frameworks and your app a chance to clear their memory first before pointing a finger at either one.

Simulate a memory warning by selecting Instrument\Simulate Memory Warning in Instruments’ menu bar, or Hardware\Simulate Memory Warning from the simulator’s menu bar. You’ll notice that memory usage dips a little, or perhaps not at all. Certainly not back to where it should be. So there’s still unbounded memory growth happening somewhere.


>  Debug\Simulate Memory Warning, 我看到的


<hr>


Easy. Click the Growth header to sort by size, make sure the heaviest objects are at the top. Right near the top of each generation, you’ll notice a row labeled ImageIO_jpeg_Data, which certainly sounds like something dealt with in your app. Click on the arrow on the left of ImageIO_jpeg_Data to display the memory addresses associated with this item. Select the first memory address to display the associated stack trace in the Extended Detail inspector on the panel to the right:



<hr>

### Note:

Make sure you launch from Xcode, triggering a build, rather than just hitting the red button in Instruments, in order to make sure you’re using the latest code. You may also want to Build and Run first before Profiling, as sometimes Xcode doesn’t seem to update the build of the app in the simulator to the latest version if you just Profile.

标记 检测， 使用 最新的代码
