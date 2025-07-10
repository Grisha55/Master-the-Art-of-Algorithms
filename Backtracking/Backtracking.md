# Backtracking: A Fundamental Problem-Solving Technique

## What is Backtracking?

Backtracking is an algorithmic technique for solving problems recursively by trying to build a solution incrementally, one piece at a time, and removing those solutions that fail to satisfy the constraints of the problem at any point in time.

## How Does It Work?

1. **Choose**: Make a choice at each step
2. **Constraint**: Check if the choice satisfies all constraints
3. **Recurse**: If it does, proceed to the next choice
4. **Backtrack**: If it doesn't, undo the choice and try another option

## Basic Structure in Swift

```swift
func backtrack(candidate: inout [Int], /* other params */) {
    if isSolution(candidate) {
        // Process the solution
        return
    }
    
    for nextChoice in possibleChoices {
        if isValid(choice: nextChoice) {
            candidate.append(nextChoice)  // Make choice
            backtrack(candidate: &candidate, /* other params */)  // Recurse
            candidate.removeLast()  // Backtrack (undo choice)
        }
    }
}
```

## When to Use Backtracking?
- When you need to explore all possible configurations
- Problems with constraints that solutions must satisfy
- Combinatorial problems (permutations, combinations, subsets)
- Puzzle problems (Sudoku, N-Queens, etc.)

## Time Complexity
Backtracking algorithms are generally O(k^n) where:
    - k is the average number of choices at each step
    - n is the number of decision points

This makes them suitable only for small input sizes.
