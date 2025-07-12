# **How Recursion Works: The Call Stack**  

## **Call Stack Mechanics**  
- Each recursive call pushes a new **stack frame** (memory for local variables/arguments).  
- When the base case is hit, the stack "unwinds" (returns values back up).  

### **Visualization: `factorial(3)`**  
```
factorial(3) → 3 * factorial(2)
factorial(2) → 2 * factorial(1)
factorial(1) → 1 * factorial(0)
factorial(0) → returns 1 (base case)
Unwinding: 1 → 1 → 2 → 6
```

## **Stack Overflow Risk**  
- Deep recursion (e.g., `factorial(100_000)`) crashes due to stack limits.  
- **Swift Note**: No Tail Call Optimization (TCO) in debug mode.  

### **Debugging Recursion**  
1. Print arguments at the start of the function.  
2. Use breakpoints to inspect the call stack in Xcode.  
