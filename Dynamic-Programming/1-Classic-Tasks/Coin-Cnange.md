# Classic Dynamic Programming Problems (Swift)

## 3. Coin Change
**Problem:** Find the minimum number of coins needed to make up a given amount (coins can be reused).

### Solution:
```swift
func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    var dp = [Int](repeating: amount + 1, count: amount + 1)
    dp[0] = 0
    
    for coin in coins {
        for i in coin...amount {
            dp[i] = min(dp[i], dp[i - coin] + 1)
        }
    }
    
    return dp[amount] > amount ? -1 : dp[amount]
}

// Example:
// coinChange([1, 2, 5], 11) → 3 (5 + 5 + 1)
// Time: O(amount * coins.count), Space: O(amount)
```
