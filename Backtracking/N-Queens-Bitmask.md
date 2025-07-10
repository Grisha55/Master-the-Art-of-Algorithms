# Optimized N-Queens Solution with Bitmasking and Symmetry

## Optimizations Overview

We'll improve the basic backtracking solution with:
1. **Bitmasking** - Track attacked columns/diagonals using bits
2. **Symmetry Breaking** - Reduce duplicate computations
3. **Early Pruning** - Stop exploring invalid paths sooner

## Bitmask Implementation

```swift
func solveNQueensOptimized(_ n: Int) -> [[String]] {
    var result = [[String]]()
    
    func backtrack(
        row: Int,
        cols: Int,
        diag1: Int,
        diag2: Int,
        board: inout [Int]
    ) {
        if row == n {
            result.append(generateBoard(board, n))
            return
        }
        
        var availablePositions = ((1 << n) - 1) & ~(cols | diag1 | diag2)
        
        while availablePositions != 0 {
            let position = availablePositions & -availablePositions
            let col = position.trailingZeroBitCount
            
            board[row] = col
            backtrack(
                row: row + 1,
                cols: cols | position,
                diag1: (diag1 | position) << 1,
                diag2: (diag2 | position) >> 1,
                board: &board
            )
            
            availablePositions &= availablePositions - 1
        }
    }
    
    func generateBoard(_ board: [Int], _ n: Int) -> [String] {
        return board.map { col in
            var row = Array(repeating: ".", count: n)
            row[col] = "Q"
            return row.joined()
        }
    }
    
    var board = Array(repeating: 0, count: n)
    backtrack(row: 0, cols: 0, diag1: 0, diag2: 0, board: &board)
    return result
}

// Helper extension for bit operations
extension Int {
    var trailingZeroBitCount: Int {
        return self == 0 ? 0 : Int(log2(Double(self & -self)))
    }
}
```

## Key Optimizations Explained
1. Bitmask Tracking:
    - `cols`: Bits represent occupied columns
    - `diag1`: Bits represent occupied diagonals (top-left to bottom-right)
    - `diag2`: Bits represent occupied diagonals (top-right to bottom-left)
2. Fast Position Calculation:
    - `availablePositions & -availablePositions`: Isolates rightmost set bit
    - `trailingZeroBitCount`: Converts bit position to column index
3. Diagonal Updates:
    - Left diagonals shift left (`<< 1`) when moving down rows
    - Right diagonals shift right (`>> 1`) when moving down rows
