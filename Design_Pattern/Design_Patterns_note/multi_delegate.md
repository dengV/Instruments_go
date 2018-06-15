
Before trying to "fix" a problem, it's a good idea to confirm one actually exists. Add the following to the top of the playground:

```
 import PlaygroundSupport
 
 
 PlaygroundPage.current.needsIndefiniteExecution = true
```

// 感觉 是在用 Playground ， 模拟 Runloop


This causes the playground to continue running even after all top-level code is executed. This is required because you'll be dispatching to a background queue, which will be executed asynchronously.
