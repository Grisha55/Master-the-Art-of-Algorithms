# Classic Dynamic Programming Problems (Swift)

## 2. Factorial
**Problem:** Compute n! (product of all positive integers ≤ n: 5! = 5×4×3×2×1 = 120).

#### DP Approach:
```swift
func factorial(_ n: Int) -> Int {
    if n == 0 { return 1 }
    var dp = [1]
    for i in 1...n {
        dp.append(i * dp[i-1])
    }
    return dp[n]
}
// Time: O(n), Space: O(n)
```

-------------------------------

#### Space-Optimized:
```swift
func factorial(_ n: Int) -> Int {
    var result = 1
    for i in 1...n {
        result *= i
    }
    return result
}
// Time: O(n), Space: O(1)
```
