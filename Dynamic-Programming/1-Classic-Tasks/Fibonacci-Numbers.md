# Classic Dynamic Programming Problems (Swift)

## 1. Fibonacci Numbers
**Problem:** Calculate the nth Fibonacci number (each number is the sum of the two preceding ones: 0, 1, 1, 2, 3, 5...).

### Approaches:
#### a) Recursive (Naive)
```swift
func fib(_ n: Int) -> Int {
    if n <= 1 { return n }
    return fib(n-1) + fib(n-2)
}
// Time: O(2^n) - Exponential
```

-----------------

#### b) Memoization (Top-Down DP)
```swift
func fib(_ n: Int, _ memo: inout [Int: Int]) -> Int {
    if let val = memo[n] { return val }
    if n <= 1 { return n }
    memo[n] = fib(n-1, &memo) + fib(n-2, &memo)
    return memo[n]!
}
// Time: O(n), Space: O(n)
```

------------------

#### c) Tabulation (Bottom-Up DP)
```swift
func fib(_ n: Int) -> Int {
    if n <= 1 { return n }
    var dp = [0, 1]
    for i in 2...n {
        dp.append(dp[i-1] + dp[i-2])
    }
    return dp[n]
}
// Time: O(n), Space: O(n)
```

-------------------

#### d) Optimized Space
```swift
func fib(_ n: Int) -> Int {
    if n <= 1 { return n }
    var a = 0, b = 1
    for _ in 2...n {
        (a, b) = (b, a + b)
    }
    return b
}
// Time: O(n), Space: O(1)
```
