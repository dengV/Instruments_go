




NSCache
=


A mutable collection you use to temporarily store transient key-value pairs that are subject to eviction when resources are low.



<hr>










Overview
=



Cache objects differ from other mutable collections in a few ways:

The NSCache class incorporates various auto-eviction policies, 
自动回收策略
which ensure that a cache doesn’t use too much of the system’s memory. If memory is needed by other applications, these policies remove some items from the cache, minimizing its memory footprint.




You can add, remove, and query items in the cache from different threads without having to lock the cache yourself.

Unlike an NSMutableDictionary object, a cache does not copy the key objects that are put into it.




You typically use NSCache objects to temporarily store objects with transient data that are expensive to create. Reusing these objects can provide performance benefits, because their values do not have to be recalculated. However, the objects are not critical to the application and can be discarded if memory is tight. If discarded, their values will have to be recomputed again when needed.

Objects that have subcomponents that can be discarded when not being used can adopt the NSDiscardableContent protocol to improve cache eviction behavior. By default, NSDiscardableContent objects in a cache are automatically removed if their content is discarded, although this automatic removal policy can be changed. If an NSDiscardableContent object is put into the cache, the cache calls discardContentIfPossible on it upon its removal.




<hr>




https://developer.apple.com/documentation/foundation/nscache?language=objc
