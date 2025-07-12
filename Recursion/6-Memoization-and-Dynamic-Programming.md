# **6. Memoization and Dynamic Programming**  

## **Memoization**  
Caching results of expensive recursive calls to avoid recomputation.  

### **Fibonacci with Memoization**  
```swift
var memo = [Int: Int]()
func fibonacciMemo(_ n: Int) -> Int {
    if let cached = memo[n] { return cached }
    if n <= 1 { return n }
    memo[n] = fibonacciMemo(n - 1) + fibonacciMemo(n - 2)
    return memo[n]!
}
print(fibonacciMemo(50)) // Fast! (vs. O(2^n) without memo)
```


## Dynamic Programming (DP)
- **Bottom-up**: Solves subproblems first (iterative).
- **Top-down**: Memoization (recursive).


### Bottom-up Fibonacci
```swift
func fibonacciDP(_ n: Int) -> Int {
    var dp = [0, 1]
    for i in 2...n {
        dp.append(dp[i-1] + dp[i-2])
    }
    return dp[n]
}
```
