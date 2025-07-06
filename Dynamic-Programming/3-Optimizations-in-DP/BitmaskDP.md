# Dynamic Programming with Bitmasks (Bitmask DP)

Bitmask DP uses binary representations (bits) to compactly represent states, often used in problems involving subsets or permutations.

## Problem Example: Traveling Salesman Problem (TSP)
Given a graph, find the shortest path visiting all nodes exactly once and returning to the start.

### Bitmask DP Approach
- Represent visited nodes as a **bitmask** (e.g., `1011` means nodes 0, 1, and 3 are visited).
- Use DP to store the shortest path for each state.

```swift
func tsp(graph: [[Int]], n: Int) -> Int {
    let INF = Int.max / 2
    let totalMasks = 1 << n
    var dp = Array(repeating: Array(repeating: INF, count: n), count: totalMasks)
    
    // Base case: starting at node 0
    dp[1][0] = 0
    
    for mask in 0..<totalMasks {
        for last in 0..<n {
            if (mask & (1 << last)) == 0 { continue }
            for next in 0..<n {
                if (mask & (1 << next)) != 0 { continue }
                let newMask = mask | (1 << next)
                dp[newMask][next] = min(dp[newMask][next], dp[mask][last] + graph[last][next])
            }
        }
    }
    
    // Return to the start node (0)
    var minCost = INF
    for last in 1..<n {
        minCost = min(minCost, dp[totalMasks - 1][last] + graph[last][0])
    }
    return minCost
}

// Example usage:
let graph = [
    [0, 10, 15, 20],
    [10, 0, 35, 25],
    [15, 35, 0, 30],
    [20, 25, 30, 0]
]
print(tsp(graph: graph, n: 4)) // Output: 80
```

## Key idea:
- A bitmask `mask` tracks visited nodes.
- `dp[mask][last]` stores the shortest path ending at `last` for the subset `mask`.
