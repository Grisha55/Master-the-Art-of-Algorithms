# Rightmost Binary Search (Last Occurrence)
Finds the last index where an element appears in a sorted array with duplicates.

When to Use:
- Calculating value ranges
- Solving "upper bound" problems
- Finding the right boundary of duplicates


## Swift Implementation
```swift
func rightmostBinarySearch(_ array: [Int], _ target: Int) -> Int {
    var low = 0
    var high = array.count
    
    while low < high {
        let mid = low + (high - low) / 2
        if array[mid] > target {
            high = mid
        } else {
            low = mid + 1
        }
    }
    return low - 1  // Returns last occurrence index
}

// Example:
print(rightmostBinarySearch(nums, 2))  // Output: 3 (last '2')
print(rightmostBinarySearch(nums, 4))  // Output: 6 (last '4')
print(rightmostBinarySearch(nums, 0))  // Output: -1 (not found)
```

## Common Mistakes to Avoid
1. **Forgetting to sort**: Always verify input is sorted
2. **Infinite loops**: Ensure bounds change each iteration (`low = mid + 1` or `high = mid - 1`)
3. **Integer overflow**: Use `mid = low + (high - low)/2` instead of `(low + high)/2`
