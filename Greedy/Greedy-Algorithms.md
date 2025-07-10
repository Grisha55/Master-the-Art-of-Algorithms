# Greedy Algorithms: Make Locally Optimal Choices for Global Results  

## **What is a Greedy Algorithm?**  
A **greedy algorithm** makes the best possible choice **at each step** to find the overall best solution. It doesn't look ahead—it just picks what seems best right now, hoping it leads to the best final result.  

### **When to Use Greedy Algorithms?**  
- When a problem can be solved by making a series of **locally optimal** (best at the moment) choices.  
- When these choices lead to a **globally optimal** (best overall) solution.  

### **Example Problems**  
- **Coin Change Problem** (Minimum coins to make an amount)  
- **Activity Selection Problem** (Maximize non-overlapping activities)  
- **Huffman Coding** (Optimal data compression)  

---

## **Example 1: Coin Change Problem (Greedy Approach)**  
**Problem:** Given coins of different values (e.g., `[1, 5, 10, 25]`), find the minimum number of coins needed to make a certain amount.  

### **Greedy Approach**  
1. Always pick the **largest possible coin first**.  
2. Subtract its value from the amount.  
3. Repeat until the amount is zero.  

### **Swift Implementation**  
```swift
func greedyCoinChange(coins: [Int], amount: Int) -> [Int] {
    let sortedCoins = coins.sorted(by: >) // Sort in descending order
    var remainingAmount = amount
    var result = [Int]()
    
    for coin in sortedCoins {
        while remainingAmount >= coin {
            remainingAmount -= coin
            result.append(coin)
        }
    }
    
    return remainingAmount == 0 ? result : []
}

// Example Usage
let coins = [1, 5, 10, 25]
let amount = 36
let change = greedyCoinChange(coins: coins, amount: amount)
print("Coins used:", change) // [25, 10, 1]
```

## Why This Works (And When It Doesn't)
✅ Works if coin denominations allow greedy choices (e.g., US coins).
❌ Fails for some cases (e.g., coins [1, 3, 4] and amount 6 → greedy gives [4, 1, 1] but optimal is [3, 3]).


## Example 2: Activity Selection Problem
**Problem**: Given a set of activities with start and end times, select the maximum number of non-overlapping activities.

### Greedy Approach
1. Sort activities by finish time (earliest first).
2. Always pick the earliest-ending activity that doesn’t conflict with the last selected one.

### Swift Implementation
```swift
struct Activity {
    let name: String
    let start: Int
    let end: Int
}

func selectActivities(_ activities: [Activity]) -> [Activity] {
    let sortedActivities = activities.sorted { $0.end < $1.end }
    var selected = [Activity]()
    
    guard let firstActivity = sortedActivities.first else { return [] }
    selected.append(firstActivity)
    
    for activity in sortedActivities.dropFirst() {
        if activity.start >= selected.last!.end {
            selected.append(activity)
        }
    }
    
    return selected
}

// Example Usage
let activities = [
    Activity(name: "A", start: 1, end: 4),
    Activity(name: "B", start: 3, end: 5),
    Activity(name: "C", start: 0, end: 6),
    Activity(name: "D", start: 5, end: 7),
    Activity(name: "E", start: 8, end: 9)
]

let selected = selectActivities(activities)
print("Selected activities:", selected.map { $0.name }) // ["A", "D", "E"]
```

## Why This Works
- By choosing the earliest-ending activity, we maximize remaining time for other activities.
- Guarantees optimal solution for this problem.



## Key Takeaways
1. Greedy algorithms make the best immediate choice without reconsidering past decisions.
2. Not always optimal, but works well for problems with the "greedy choice property".
3. Efficient (often O(n log n) due to sorting).


### When to Avoid Greedy?
- When local choices don’t guarantee a global optimum.
- When you need to explore all possible solutions (use Dynamic Programming instead).


