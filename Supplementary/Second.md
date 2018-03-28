
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

* Unbounded memory growth is where memory continues to be allocated and is never given a chance to be deallocated. If this continues forever, then at some point the system’s memory will be filled and you’ll have a big memory problem on your hands. On iOS this means that the app will be killed by the system.




<hr>

<hr>


