# Subarray Problems

## What are Subarray Problems?
Subarray problems involve finding or analyzing contiguous parts of an array that meet certain conditions. Common examples include:
- Finding subarrays with maximum sum
- Finding subarrays that sum to a target value
- Counting subarrays that satisfy certain properties

## Prefix Sums in Subarray Problems
Prefix sums are often used to solve subarray problems efficiently by transforming them into problems about pairs of indices in the prefix sum array.

## Example: Count Subarrays with Given Sum
```swift
func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var count = 0
    var sum = 0
    var prefixSums = [0: 1] // sum: count
    
    for num in nums {
        sum += num
        if let prevCount = prefixSums[sum - k] {
            count += prevCount
        }
        prefixSums[sum] = (prefixSums[sum] ?? 0) + 1
    }
    
    return count
}

print(subarraySum([1, 1, 1], 2)) // 2 (subarrays [1,1] and [1,1])
```

## Common Subarray Problems
1. Maximum Subarray (Kadane's Algorithm)
2. Subarrays with exactly K distinct elements
3. Longest subarray with sum ≤ target
4. Minimum size subarray with sum ≥ target

## Tips
- For problems about sums, consider prefix sums
- For problems about contiguous elements, consider sliding window
- For maximum/minimum problems, consider dynamic programming
