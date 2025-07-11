# Optimizations with Prefix Sums

## How Prefix Sums Optimize Solutions
Prefix sums provide several optimization opportunities:
1. **Time Complexity**: Reduce range sum queries from O(n) to O(1)
2. **Space-Time Tradeoff**: Use O(n) space to store prefix sums for faster queries
3. **Problem Transformation**: Convert subarray problems into prefix sum difference problems

## Example: Equilibrum Index
Find an index where sum of elements before equals sum after:
```swift
func equilibriumIndex(_ nums: [Int]) -> Int {
    let totalSum = nums.reduce(0, +)
    var leftSum = 0
    
    for (i, num) in nums.enumerated() {
        let rightSum = totalSum - leftSum - num
        if leftSum == rightSum {
            return i
        }
        leftSum += num
    }
    
    return -1
}

print(equilibriumIndex([-7, 1, 5, 2, -4, 3, 0])) // 3
```

## Advanced Optimizations
1. 2D Prefix Sums: For matrix range queries
2. Binary Indexed Trees: For dynamic prefix sums with updates
3. Segment Trees: For more complex range queries

  
##Swift Implementation of 2D Prefix Sum
```swift
class NumMatrix {
    private var prefix: [[Int]]
    
    init(_ matrix: [[Int]]) {
        let m = matrix.count
        let n = matrix[0].count
        prefix = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        
        for i in 1...m {
            for j in 1...n {
                prefix[i][j] = matrix[i-1][j-1] + prefix[i-1][j] + prefix[i][j-1] - prefix[i-1][j-1]
            }
        }
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        return prefix[row2+1][col2+1] - prefix[row1][col2+1] - prefix[row2+1][col1] + prefix[row1][col1]
    }
}
```

## When to Consider Prefix Sum Optimizations
- When dealing with multiple range sum queries
- When the problem can be transformed to depend on cumulative sums
- When you need to trade space for faster query times
