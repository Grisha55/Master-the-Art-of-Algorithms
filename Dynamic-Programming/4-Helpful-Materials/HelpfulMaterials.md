# 🚀 Ultimate Dynamic Programming Learning Guide

*Curated resources for beginners to advanced learners*  
*All materials are in English*

---

## 📚 **Books**

### 1. **"Introduction to Algorithms" (CLRS)**
   - **Authors**: Cormen, Leiserson, Rivest, Stein
   - **Level**: Intermediate to Advanced
   - **Key Features**:
     - The algorithm "bible"
     - Rigorous mathematical treatment of DP
     - Covers knapsack, LCS, shortest paths
   - **Best For**: Foundational understanding

### 2. **"Algorithm Design Manual" by Steven Skiena**
   - **Level**: Beginner-friendly
   - **Key Features**:
     - Practical problem-solving approach
     - "War stories" from real applications
     - Excellent DP intuition builder
   - **Best For**: Learning DP patterns

### 3. **"Dynamic Programming for Coding Interviews"**
   - **Authors**: Meenakshi & Kamal Rawat
   - **Level**: Beginner to Intermediate
   - **Key Features**:
     - 50+ interview-style problems
     - Step-by-step solutions
     - Space-time optimization tips
   - **Best For**: Interview preparation

---

## 🎥 **Courses & Lectures**

### 4. **MIT 6.006 (Introduction to Algorithms)**
   - **Format**: Free (YouTube/OCW)
   - **Highlights**:
     - Recursion → Memoization → Tabulation
     - Academic but clear explanations
   - **Duration**: ~4 hours of DP content

### 5. **GeeksforGeeks DP Playlist**
   - **Format**: Free (YouTube)
   - **Topics**:
     - Top-down vs bottom-up
     - Knapsack, LIS, matrix chain
   - **Best For**: Quick practical overview

### 6. **Coursera: "Algorithms Specialization"**
   - **Instructor**: Tim Roughgarden (Stanford)
   - **Key Features**:
     - Week 5 dedicated to DP
     - Python/C++ assignments
   - **Cost**: Free audit option

---

## 💻 **Interactive Practice**

| Platform | Description | Difficulty |
|----------|-------------|------------|
| [LeetCode DP Study Plan](https://leetcode.com/studyplan/dynamic-programming/) | Curated problems with solutions | Easy → Hard |
| [AtCoder DP Contest](https://atcoder.jp/contests/dp) | 26 classical DP problems | Intermediate |
| [Codeforces EDU](https://codeforces.com/edu/course/2) | Advanced DP techniques | Hard |

---

## 📝 **Tutorials & References**

### **Top Resources:**
- [TopCoder DP Tutorial](https://www.topcoder.com/thrive/articles/Dynamic%20Programming:%20From%20Novice%20to%20Advanced) (Beginner to Advanced)
- [CP-Algorithms DP Section](https://cp-algorithms.com/dynamic_programming.html) (Concise reference)
- [WilliamFiset's DP Playlist](https://www.youtube.com/playlist?list=PLDV1Zeh2NRsAsbafOroUBnNV8fhZa7P4u) (Visual explanations)

---

## 🔥 **Advanced Resources**
```swift
// Example: Bitmask DP solution for TSP
func solveTSP(graph: [[Int]], n: Int) -> Int {
    let INF = Int.max / 2
    var dp = Array(repeating: Array(repeating: INF, count: n), 
                  count: 1 << n)
    dp[1][0] = 0 // Base case: starting at node 0
    
    for mask in 0..<(1 << n) {
        for last in 0..<n {
            guard (mask & (1 << last)) != 0 else { continue }
            // ... DP transitions ...
        }
    }
    return dp[(1 << n) - 1][n - 1]
}
```
---

## Must-Study Advanced Materials:

### **1. USACO Guide DP Section**
- Competitive programming-focused
- Covers state reduction tricks

### **2. "Art of Programming Contest" DP Chapter**
- Free PDF available online
- Advanced state representation techniques

### **3. Codeforces DP EDU**
- Meet-in-the-middle
- DP on trees and graphs

---

## 🗺️ Structured Learning Path

### 🌱 For Beginners

1. **Start With:**
    - Skiena's book (for intuition)
    - LeetCode Easy problems (Fibonacci, Climbing Stairs)

2. **Then Move To:**
    - GeeksforGeeks video tutorials
    - MIT 6.006 lectures (DP sections)

### 🏗️ For Intermediates

1. **Core Study:**
    - CLRS book (DP chapter)
    - AtCoder DP Contest (all 26 problems)

2. **Supplement With:**
    - TopCoder tutorials
    - Codeforces EDU (basic DP)

### 🧠 For Experts

1. **Master:**
    - USACO Guide advanced DP
    - Bitmask DP (TSP problems)

2. **Optimization Focus:**
    - Knuth's optimization
    - Convex hull trick
    
```
"Dynamic Programming is just a fancy name for memoization and reusing solutions to subproblems."
— Steven Skiena
```
**Pro Tip:** Always implement DP solutions in code - theory alone isn't enough!
