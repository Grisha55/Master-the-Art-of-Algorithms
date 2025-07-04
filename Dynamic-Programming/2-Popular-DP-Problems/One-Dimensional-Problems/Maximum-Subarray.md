# Classic Dynamic Programming Problems (Swift)

## 3. Maximum Subarray
**Problem:** Given an integer array nums, find the subarray with the largest sum, and return its sum.

### Solution (Kadane's Algorithm):
```swift
func maxSubArray(_ nums: [Int]) -> Int {
    var currentSum = nums[0]  // Tracks maximum sum ending at current position
    var maxSum = nums[0]      // Tracks overall maximum sum found
    
    for i in 1..<nums.count {
        // Choose between starting new subarray or extending previous one
        currentSum = max(nums[i], currentSum + nums[i])
        // Update overall maximum if current sum is better
        maxSum = max(maxSum, currentSum)
    }
    
    return maxSum
}
```

### How It Works:

1. Initialize both currentSum and maxSum with the first element
2. For each subsequent number:
    - Decide whether to:
        - Start a new subarray from current number (nums[i]), or
        - Add current number to existing subarray (currentSum + nums[i])

    - Keep track of the highest sum found (maxSum)


### Why It's Efficient:

- Time Complexity: O(n) - single pass through the array
- Space Complexity: O(1) - uses constant extra space


### Alternative Implementation (More Explicit Kadane's)
```swift
func maxSubArrayKadane(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }
    
    var maxCurrent = nums[0]
    var maxGlobal = nums[0]
    
    for i in 1..<nums.count {
        maxCurrent = max(nums[i], maxCurrent + nums[i])
        if maxCurrent > maxGlobal {
            maxGlobal = maxCurrent
        }
    }
    
    return maxGlobal
}
```

### Key Differences:

- More explicit variable names (maxCurrent and maxGlobal)
- Direct comparison instead of using max() for global update
- Handles empty array case (though problem states non-empty)


### Test Cases:
```
print(maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4]))  // Output: 6
print(maxSubArray([1]))                               // Output: 1
print(maxSubArray([5, 4, -1, 7, 8]))                 // Output: 23
print(maxSubArray([-1, -2, -3]))                     // Output: -1
```

#### Edge Cases Covered:

1. Array with both positive and negative numbers
2. Single-element array
3. All-positive numbers
4. All-negative numbers

### Visual Walkthrough (for first example)
```
Index: 0: currentSum = -2, maxSum = -2
Index: 1: choose between (1) or (-2+1=-1) → 1
Index: 2: choose between (-3) or (1-3=-2) → -2
Index: 3: choose between (4) or (-2+4=2) → 4
Index: 4: choose between (-1) or (4-1=3) → 3
Index: 5: choose between (2) or (3+2=5) → 5
Index: 6: choose between (1) or (5+1=6) → 6
Index: 7: choose between (-5) or (6-5=1) → 1
Index: 8: choose between (4) or (1+4=5) → 5
Final maxSum = 6
```
