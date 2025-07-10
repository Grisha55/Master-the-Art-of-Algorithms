# Symmentry Breaking

For even better performance, we can exploit board symmetry:

```swift
func solveNQueensWithSymmetry(_ n: Int) -> [[String]] {
    var result = [[String]]()
    
    // Only need to try first half of columns for first row when n is even
    let maxFirstCol = n % 2 == 0 ? n / 2 : (n + 1) / 2
    
    for firstCol in 0..<maxFirstCol {
        var board = Array(repeating: 0, count: n)
        board[0] = firstCol
        
        backtrack(
            row: 1,
            cols: 1 << firstCol,
            diag1: 1 << (firstCol + 1),
            diag2: 1 << (firstCol - 1),
            board: &board
        )
        
        // Mirror the solution for even n
        if n % 2 == 0 || firstCol != maxFirstCol - 1 {
            let mirrored = board.map { n - 1 - $0 }
            result.append(generateBoard(mirrored, n))
        }
    }
    
    return result
}
```

```
## Time Complexity Analysis

| Method               | Worst Case      | Average Case   | Best Case |
|----------------------|-----------------|----------------|-----------|
| Basic Backtracking   | O(N!)           | O(N!)          | O(N!)     |
| Bitmask Backtracking | O(N!)           | O(N!/4)        | O(N)      |
| Symmetry Optimized   | O(N!/2)         | O(N!/8)        | O(1)      |
```

## When to Use Which Version?
- **Basic**: Best for learning/teaching concepts
- **Bitmask**: Use for N ≤ 15 in production code
- **Symmetry**: Use when you need all solutions for even N


## Further Optimizations
1. Iterative Implementation:
    - Can avoid recursion overhead for very large N
2. Parallel Processing:
    - Different first-row placements can be processed independently
3. Memoization:
    - Cache partial solutions for problems with repeating patterns
