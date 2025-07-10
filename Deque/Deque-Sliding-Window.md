# Sliding Window with Deque

## Problem Example
Find maximum in each window of size `k` in an array:

Input: `[1, 3, -1, -3, 5, 3, 6, 7]`, `k = 3`  
Output: `[3, 3, 5, 5, 6, 7]`

## Optimal Solution with Deque
```swift
func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    var result = [Int]()
    var deque = [Int]() // Stores indices, not values
    
    for i in 0..<nums.count {
        // Remove elements not in current window
        while !deque.isEmpty && deque.first! <= i - k {
            deque.removeFirst()
        }
        
        // Remove smaller elements from back
        while !deque.isEmpty && nums[deque.last!] < nums[i] {
            deque.removeLast()
        }
        
        deque.append(i)
        
        // Append maximum (front of deque)
        if i >= k - 1 {
            result.append(nums[deque.first!])
        }
    }
    
    return result
}
```


## Why This Works:
1. Deque maintains candidates for current window maximum
2. O(n) time - Each element enters/exits deque exactly once
3. Front always has max for current window
