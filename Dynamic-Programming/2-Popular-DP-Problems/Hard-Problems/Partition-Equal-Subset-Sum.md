# Partition Equal Subset Sum Problem Explained

## Problem Description
Given an integer array nums, return true if you can partition the array into two subsets such that the sum of the elements in both subsets is equal or false otherwise.

## Swift Implementation
```swift
class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let totalSum = nums.reduce(0, +)
    
        // If total sum is odd, we can't partition into two equal subsets
        guard totalSum % 2 == 0 else { 
            return false 
        }
    
        let target = totalSum / 2
        let n = nums.count
    
        // dp[i][j] = true if sum j can be formed with first i elements
        var dp = Array(repeating: Array(repeating: false, count: target + 1), 
                    count: n + 1)
    
        // Base case: sum 0 can always be formed with empty subset
        for i in 0...n {
            dp[i][0] = true
        }
    
        for i in 1...n {
            for j in 1...target {
                if nums[i-1] > j {
                    // Current number is too big, exclude it
                    dp[i][j] = dp[i-1][j]
                } else {
                    // Either exclude or include the current number
                    dp[i][j] = dp[i-1][j] || dp[i-1][j - nums[i-1]]
                }
            }
        }
    
        return dp[n][target]
    }
}
```

## Optimized Space Solution (1D DP)
```swift
func canPartitionOptimized(_ nums: [Int]) -> Bool {
    let totalSum = nums.reduce(0, +)
    
    guard totalSum % 2 == 0 else { 
        return false 
    }
    
    let target = totalSum / 2
    var dp = Array(repeating: false, count: target + 1)
    dp[0] = true  // Base case: sum 0 is always possible
    
    for num in nums {
        // Iterate backwards to prevent overwriting
        for j in stride(from: target, through: num, by: -1) {
            dp[j] = dp[j] || dp[j - num]
        }
        
        // Early termination if we find the target
        if dp[target] {
            return true
        }
    }
    
    return dp[target]
}
```

## Detailed Explanation

1. **Initial Check:**
    - First calculate the total sum of all numbers
    - If the sum is odd, immediately return false since we can't split an odd sum into two equal parts

2. **Target Calculation:**
    - Our target becomes `totalSum / 2`
    - Now the problem reduces to finding a subset that sums to this target

3. **DP Table Setup:**
    - `dp[i][j]` represents whether sum `j` can be formed using the first `i` elements
    - Initialize all `dp[i][0]` to true because sum 0 can always be formed (empty subset)

4. **Filling the DP Table:**
    - For each number in the array, we decide whether to:
        - Exclude it: carry forward the previous result (`dp[i-1][j]`)
        - Include it: check if we can form `j - currentNum` with previous elements
    - The result is the OR of these two possibilities

5. **Optimization:**
    - The space-optimized version uses a 1D array and iterates backwards
    - This prevents overwriting values we'll need later in the same iteration
    - We can terminate early if we find the target sum


## Time and Space Complexity
- Time Complexity: O(n × target)
- Space Complexity:
    - Original: O(n × target)
    - Optimized: O(target)


