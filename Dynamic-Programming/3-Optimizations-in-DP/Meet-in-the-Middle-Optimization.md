
# Dynamic Programming: Meet-in-the-Middle for DP Optimization

Meet-in-the-Middle splits a problem into two halves, solves them independently, and combines the results. It reduces exponential time (e.g., O(2^N) → O(2^(N/2))).

## Problem Example: Subset Sum
Given an array `arr`, find if a subset sums to `target`.

### Brute Force (O(2^N))
```swift
func subsetSum(_ arr: [Int], target: Int) -> Bool {
    func dfs(_ index: Int, _ sum: Int) -> Bool {
        if sum == target { return true }
        if index >= arr.count { return false }
        return dfs(index + 1, sum) || dfs(index + 1, sum + arr[index])
    }
    return dfs(0, 0)
}
```

## Meet-in-the-Middle (O(2^(N/2)))
1. Split the array into two halves.
2. Generate all subset sums for each half.
3. Check if a sum from the first half combines with a sum from the second half to reach target.
```swift
func subsetSumOptimized(_ arr: [Int], target: Int) -> Bool {
    let n = arr.count
    let half = n / 2
    var leftSums = [Int]()
    var rightSums = [Int]()
    
    // Generate all subset sums for left half
    for mask in 0..<(1 << half) {
        var sum = 0
        for i in 0..<half {
            if mask & (1 << i) != 0 {
                sum += arr[i]
            }
        }
        leftSums.append(sum)
    }
    
    // Generate all subset sums for right half
    for mask in 0..<(1 << (n - half)) {
        var sum = 0
        for i in 0..<(n - half) {
            if mask & (1 << i) != 0 {
                sum += arr[half + i]
            }
        }
        rightSums.append(sum)
    }
    
    // Check for target in left or right halves alone
    if leftSums.contains(target) || rightSums.contains(target) {
        return true
    }
    
    // Sort and use two pointers to find (left + right == target)
    let sortedRight = rightSums.sorted()
    for left in leftSums {
        let remaining = target - left
        if sortedRight.binarySearch(remaining) != nil {
            return true
        }
    }
    return false
}

// Binary search helper
extension Array where Element: Comparable {
    func binarySearch(_ value: Element) -> Int? {
        var low = 0, high = count - 1
        while low <= high {
            let mid = (low + high) / 2
            if self[mid] == value { return mid }
            else if self[mid] < value { low = mid + 1 }
            else { high = mid - 1 }
        }
        return nil
    }
}

// Example usage:
let arr = [3, 1, 5, 7, 2]
print(subsetSumOptimized(arr, target: 10)) // Output: true
```
## Key Idea:
- Splitting the problem reduces exponential time by a square root factor.
- Combine results efficiently (e.g., binary search).
