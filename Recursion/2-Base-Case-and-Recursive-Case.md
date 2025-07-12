# Base Case and Recursive Case 

## **Base Case**  
The **base case** is the condition that stops the recursion. Without it, the function would call itself indefinitely, leading to a stack overflow.  

## **Recursive Case**  
The **recursive case** breaks the problem into smaller subproblems and calls the function itself with modified arguments.  

### **Example: Sum of Numbers from 1 to N**  
```swift
func sum(_ n: Int) -> Int {
    // Base case
    if n == 0 {
        return 0
    }
    // Recursive case
    return n + sum(n - 1)
}
print(sum(5)) // Output: 15 (1+2+3+4+5)
```

## Why Both Are Necessary
- **Missing Base Case** → Infinite recursion → Crash (`EXC_BAD_ACCESS`).
- **Missing Recursive Case** → Function runs once (no recursion happens).


## Common Mistakes
- Forgetting to decrement/increment the argument (leads to infinite recursion).
- Incorrect base condition (e.g., `if n == 1` instead of `if n == 0`).
