# Prefix Sums (Prefix Arrays)

## What are Prefix Sums?
Prefix sums (or prefix arrays) are a technique used to quickly calculate the sum of elements in any subarray of a given array. The idea is to precompute cumulative sums and store them in a separate array.

## Why use Prefix Sums?
- They allow **O(1)** range sum queries after **O(n)** preprocessing
- Useful for problems involving frequent range sum calculations
- Help optimize solutions to many array-based problems

## How it works
1. Create a prefix array where each element at index `i` represents the sum of all elements from the start of the original array up to (but not including) index `i`
2. To get the sum between indices `i` and `j`, calculate `prefix[j] - prefix[i]`

## Swift Implementation
```swift
func calculatePrefixSum(_ array: [Int]) -> [Int] {
    var prefix = [Int](repeating: 0, count: array.count + 1)
    for i in 0..<array.count {
        prefix[i + 1] = prefix[i] + array[i]
    }
    return prefix
}

let nums = [1, 2, 3, 4, 5]
let prefix = calculatePrefixSum(nums)
print(prefix) // [0, 1, 3, 6, 10, 15]

// Query: Sum from index 1 to 3 (elements 2+3+4)
let sum = prefix[4] - prefix[1]
print(sum) // 9
```

## Common Use Cases
- Finding sum of any subarray in constant time
- Solving problems with multiple range sum queries
- As a building block for more complex algorithms
