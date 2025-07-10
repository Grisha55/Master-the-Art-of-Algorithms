# N-Queens Problem Using Backtracking

## Problem Statement

Place N chess queens on an N×N chessboard so that no two queens threaten each other (no two queens share the same row, column, or diagonal).

## Backtracking Approach

1. Start placing queens row by row
2. For each row, try placing a queen in each column
3. If the placement is valid (no conflicts), proceed to the next row
4. If no valid placement is found, backtrack to the previous row and try the next column

## Swift Implementation

```swift
func solveNQueens(_ n: Int) -> [[String]] {
    var result = [[String]]()
    var board = Array(repeating: Array(repeating: ".", count: n), count: n)
    
    func isSafe(_ row: Int, _ col: Int) -> Bool {
        // Check column
        for i in 0..<row {
            if board[i][col] == "Q" {
                return false
            }
        }
        
        // Check upper left diagonal
        var i = row - 1, j = col - 1
        while i >= 0 && j >= 0 {
            if board[i][j] == "Q" {
                return false
            }
            i -= 1
            j -= 1
        }
        
        // Check upper right diagonal
        i = row - 1
        j = col + 1
        while i >= 0 && j < n {
            if board[i][j] == "Q" {
                return false
            }
            i -= 1
            j += 1
        }
        
        return true
    }
    
    func backtrack(_ row: Int) {
        if row == n {
            result.append(board.map { $0.joined() })
            return
        }
        
        for col in 0..<n {
            if isSafe(row, col) {
                board[row][col] = "Q"  // Place queen
                backtrack(row + 1)    // Recurse next row
                board[row][col] = "."  // Backtrack
            }
        }
    }
    
    backtrack(0)
    return result
}

// Example usage for 4 queens:
let solutions = solveNQueens(4)
for solution in solutions {
    for row in solution {
        print(row)
    }
    print("")
}
```


## Explanation
1. isSafe function: Checks if placing a queen at (row, col) is safe by:
    - Checking the column above the position
    - Checking both upper diagonals
2. backtrack function:
    - Base case: If we've placed queens in all rows, save the solution
    - Recursive case: Try each column in the current row, and if safe, recurse to next row
3. Result: Returns all valid board configurations as an array of strings

## Optimization
The algorithm can be optimized further by:
    - Using bitmasking to track occupied columns and diagonals
    - Implementing symmetry breaking to avoid duplicate solutions
