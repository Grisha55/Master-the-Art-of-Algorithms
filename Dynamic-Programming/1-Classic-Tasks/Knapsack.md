# Classic Dynamic Programming Problems (Swift)

## 4. 0/1 Knapsack
**Problem:** Given items with weights and values, determine the maximum value you can carry in a knapsack of fixed capacity (each item can be taken only once).

### Solution:
```swift
func knapsack(_ weights: [Int], _ values: [Int], _ capacity: Int) -> Int {
    let n = weights.count
    var dp = [[Int]](repeating: [Int](repeating: 0, count: capacity + 1), count: n + 1)
    
    for i in 1...n {
        for w in 1...capacity {
            if weights[i-1] <= w {
                dp[i][w] = max(values[i-1] + dp[i-1][w - weights[i-1]], dp[i-1][w])
            } else {
                dp[i][w] = dp[i-1][w]
            }
        }
    }
    
    return dp[n][capacity]
}

// Example:
// weights = [1, 3, 4, 5], values = [1, 4, 5, 7], capacity = 7
// → Max value: 9 (items 3 and 4)
// Time: O(n * capacity), Space: O(n * capacity)
```
