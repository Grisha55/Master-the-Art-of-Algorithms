# ** Introduction to Recursion**  

## **What is Recursion?**  
Recursion occurs when a function calls itself to solve a smaller version of the same problem. It’s useful for tasks that can be divided into similar subtasks (e.g., tree traversals, factorial calculation).  

## **Basic Structure**  
Every recursive function has:  
1. **Base Case**: The condition that stops recursion.  
2. **Recursive Case**: The part where the function calls itself.  

### **Example: Factorial in Swift**  
```swift
func factorial(_ n: Int) -> Int {
    if n == 0 {  // Base case
        return 1
    }
    return n * factorial(n - 1)  // Recursive case
}
print(factorial(5)) // Output: 120
```

## Why Use Recursion?
- Simplifies code for problems with recursive patterns.
- Natural fit for algorithms like DFS, backtracking, and divide-and-conquer.


## Pitfalls
- Stack overflow if the base case is missing.
- Can be less efficient than iteration due to function call overhead.
