
## NSMapTable


A collection similar to a dictionary, but with a broader range of available memory semantics.


<hr>

相当于 dictionary ， 内存管理 语义， 更加 灵活

<hr>


<hr>

### Overview


The map table is modeled after NSDictionary with the following differences:




* Keys and/or values are optionally held “weakly” such that entries are removed when one of the objects is reclaimed.



* Its keys or values may be copied on input or may use pointer identity for equality and hashing.
可以使用 指针 判定相等


* It can contain arbitrary pointers (its contents are not constrained to being objects).


<hr>


You can configure an NSMapTable instance to operate on arbitrary pointers and not just objects, although typically you are encouraged to use the C function API for void * pointers.

### The object-based API (such as setObject(_:forKey:)) will not work for non-object pointers without type-casting.



When configuring map tables, note that only the options listed in NSMapTableOptions guarantee that the rest of the API will work correctly—including copying, archiving, and fast enumeration. While other NSPointerFunctions options are used for certain configurations, such as to hold arbitrary pointers, not all combinations of the options are valid. With some combinations the map table may not work correctly, or may not even be initialized correctly.

<hr>


###  Subclassing Notes


NSMapTable is not suitable for subclassing.
