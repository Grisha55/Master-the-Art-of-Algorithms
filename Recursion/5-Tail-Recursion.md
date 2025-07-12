# **5. Tail Recursion**  

## **What is Tail Recursion?**  
A recursive function is **tail-recursive** if the recursive call is the **last operation** before returning. Swift optimizes these to avoid stack growth (like a loop).  

### **Non-Tail vs. Tail Recursive Factorial**  
```swift
// Non-tail recursive (multiplication after recursion)
func factorial(_ n: Int) -> Int {
    if n == 0 { return 1 }
    return n * factorial(n - 1)  // ❌ Not tail-recursive
}

// Tail-recursive (accumulator pattern)
func factorialTail(_ n: Int, _ accumulator: Int = 1) -> Int {
    if n == 0 { return accumulator }
    return factorialTail(n - 1, n * accumulator)  // ✅ Tail-recursive
}
```

## Key Points
- Tail recursion requires an accumulator to pass intermediate results.
- Enable optimization with @_optimize(none) in Swift for debugging.
- Works in release mode (-O flag).
