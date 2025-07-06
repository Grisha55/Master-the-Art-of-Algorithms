# Dynamic Programming: Reducing Space Complexity (O(N²) → O(N))

Dynamic Programming (DP) often uses `tables` to store intermediate results, which can lead to high memory usage. `Optimizing space complexity` is crucial for large inputs.

## Problem Example: Longest Common Subsequence (LCS)
The standard LCS DP solution uses a 2D table with space complexity **O(N²)**. We can reduce it to **O(N)**.

### Standard Approach (O(N²) Space)
```swift
func lcs(_ text1: String, _ text2: String) -> Int {
    let m = text1.count, n = text2.count
    let s1 = Array(text1), s2 = Array(text2)
    var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
    
    for i in 1...m {
        for j in 1...n {
            if s1[i-1] == s2[j-1] {
                dp[i][j] = dp[i-1][j-1] + 1
            } else {
                dp[i][j] = max(dp[i-1][j], dp[i][j-1])
            }
        }
    }
    return dp[m][n]
}
```

## Optimized Approach (O(N) Space)

### Use two 1D arrays instead of a 2D table:
```swift
func lcsOptimized(_ text1: String, _ text2: String) -> Int {
    let m = text1.count, n = text2.count
    let s1 = Array(text1), s2 = Array(text2)
    var prev = Array(repeating: 0, count: n + 1)
    var curr = Array(repeating: 0, count: n + 1)
    
    for i in 1...m {
        for j in 1...n {
            if s1[i-1] == s2[j-1] {
                curr[j] = prev[j-1] + 1
            } else {
                curr[j] = max(prev[j], curr[j-1])
            }
        }
        prev = curr
    }
    return curr[n]
}
```

## Key Idea:
- Only the previous row (`prev`) is needed to compute the current row (`curr`).
- Swap `prev` and `curr` after each iteration.
