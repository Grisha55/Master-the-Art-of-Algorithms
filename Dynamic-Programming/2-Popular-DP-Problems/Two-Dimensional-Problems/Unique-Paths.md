# Unique Paths Problem Explained

## Problem Description
A robot needs to navigate from the top-left corner (position [0,0]) to the bottom-right corner (position [m-1,n-1]) of an m×n grid. The robot can only move:
- **Right** (→)
- **Down** (↓)

**Question:** How many unique possible paths exist?

## Solution Approach
We use dynamic programming to efficiently count all possible paths without recalculating overlapping subproblems.

### Swift Implementation
```swift
func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var dp = Array(repeating: 1, count: n)
    
    for _ in 1..<m {
        for j in 1..<n {
            dp[j] += dp[j - 1]
        }
    }
    
    return dp[n - 1]
}
```

## How it Works

### Key Insights
1. Base Case:
    - First row and first column always have exactly 1 path
    - `dp = [1, 1, 1, ..., 1]` (array of size n)

2. DP Array Update:
```
for each row (from 1 to m-1):
    for each column (from 1 to n-1):
        paths[current_cell] = paths[above] + paths[left]
        (which is dp[j] += dp[j-1])
```


## Visualization (3×3 Grid Example)

###Initial state (first row):
```
dp = [1, 1, 1]
```
### After processing second row:
```
dp[1] = dp[1] + dp[0] → 1 + 1 = 2
dp[2] = dp[2] + dp[1] → 1 + 2 = 3
New dp: [1, 2, 3]
```
### After processing third row:
```
dp[1] = 2 + 1 = 3
dp[2] = 3 + 3 = 6
Final dp: [1, 3, 6]
```
### Result: 6 unique paths


## Time and Space Complexity
    - Time Complexity: O(m×n) - We iterate through each cell once
    - Space Complexity: O(n) - We only maintain a 1D array of size n

## Test Cases
```swift
print(uniquePaths(3, 2))  // Output: 3
print(uniquePaths(3, 3))  // Output: 6
print(uniquePaths(1, 1))  // Output: 1
print(uniquePaths(7, 3))  // Output: 28
```


## Edge Cases Covered:
1. Small grid (1×1)
2. Rectangular grids (3×2)
3. Square grids (3×3)
4. Larger grids (7×3)


## Alternative Approaches

## 1. Mathematical (Combinarotics)
```swift
func uniquePathsMath(_ m: Int, _ n: Int) -> Int {
    let total = m + n - 2
    let k = min(m - 1, n - 1)
    var result = 1
    
    for i in 1...k {
        result = result * (total - k + i) / i
    }
    
    return result
}
```

## Classic 2D DP
```swift
func uniquePaths2D(_ m: Int, _ n: Int) -> Int {
    var dp = Array(repeating: Array(repeating: 1, count: n), count: m)
    
    for i in 1..<m {
        for j in 1..<n {
            dp[i][j] = dp[i-1][j] + dp[i][j-1]
        }
    }
    
    return dp[m-1][n-1]
}
```


## Key Takeaways
1. The 1D DP solution is space-optimized
2. The problem follows Pascal's Triangle pattern
3. Mathematical solution is fastest but may overflow for large grids
```
This Markdown file includes:
1. Clear problem statement
2. Well-commented Swift implementation
3. Step-by-step explanation
4. Visual examples
5. Complexity analysis
6. Test cases
7. Alternative approaches
8. Proper formatting for GitHub/syntax highlighting
```
