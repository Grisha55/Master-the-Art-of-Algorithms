# Leftmost Binary Search (First Occurrence)
Finds the first index where an element appears in a sorted array with duplicates.

## When to Use:
- Finding insertion positions
- Counting occurrences of a value
- Solving "lower bound" problems


## Swift Implementation:
```swift
func leftmostBinarySearch(_ array: [Int], _ target: Int) -> Int {
    var low = 0
    var high = array.count
    
    while low < high {
        let mid = low + (high - low) / 2
        if array[mid] < target {
            low = mid + 1
        } else {
            high = mid
        }
    }
    return low  // Returns insertion point if not found
}

// Example:
let nums = [1, 2, 2, 2, 3, 4, 4, 5]
print(leftmostBinarySearch(nums, 2))  // Output: 1 (first '2')
print(leftmostBinarySearch(nums, 4)) // Output: 5 (first '4')
print(leftmostBinarySearch(nums, 6)) // Output: 8 (insertion point)
```
