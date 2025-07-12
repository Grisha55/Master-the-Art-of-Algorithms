# **8. When to Use Recursion**  

## **Advantages**  
✅ Cleaner code for recursive problems (e.g., trees, backtracking).  
✅ Natural fit for divide-and-conquer algorithms (e.g., mergesort).  

## **Disadvantages**  
❌ Stack overflow risk for deep recursion.  
❌ Overhead of function calls (slower than iteration in some cases).  

## **When to Avoid**  
- Problems with large `n` (e.g., Fibonacci(1000)).  
- Performance-critical sections (use iteration/memoization).  

## **Alternatives**  
- **Iteration**: Use loops for linear problems (e.g., factorial).  
- **Memoization**: Cache results for overlapping subproblems.  
- **Stack Data Structure**: Simulate recursion manually (e.g., DFS with a stack).  
