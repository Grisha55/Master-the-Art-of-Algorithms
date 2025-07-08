# Graph Traversal: DFS and BFS in Swift

Traversing a graph means visiting all its nodes in a specific order. Two fundamental algorithms for this are **Depth-First Search (DFS)** and **Breadth-First Search (BFS)**. Let's implement them in Swift!

## 1. Depth-First Search (DFS)
DFS explores as far as possible along a branch before backtracking. It's great for solving puzzles, pathfinding, and detecting cycles.

### Swift Implementation (Recursive):
```swift
func dfs(_ graph: [Int: [Int]], start: Int, visited: inout Set<Int>) {
    print("Visited: \(start)")
    visited.insert(start)
    
    for neighbor in graph[start] ?? [] {
        if !visited.contains(neighbor) {
            dfs(graph, start: neighbor, visited: &visited)
        }
    }
}

// Example usage:
let adjacencyList = [
    0: [1, 2],
    1: [0, 3],
    2: [0],
    3: [1]
]
var visitedNodes = Set<Int>()
dfs(adjacencyList, start: 0, visited: &visitedNodes)
// Output: Visited: 0 → 1 → 3 → 2
```

### Key Points:
- Uses a stack (implicitly via recursion).
- Time Complexity: O(V + E) (Vertices + Edges).


## 2. Breadth-First Search (BFS)
BFS explores all neighbors at the present level before moving deeper. It's ideal for finding the shortest path in unweighted graphs.

### Swift Implementation (Using a Queue):
```swift
func bfs(_ graph: [Int: [Int]], start: Int) {
    var visited = Set<Int>()
    var queue = [start]
    visited.insert(start)
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        print("Visited: \(node)")
        
        for neighbor in graph[node] ?? [] {
            if !visited.contains(neighbor) {
                visited.insert(neighbor)
                queue.append(neighbor)
            }
        }
    }
}

// Example usage:
bfs(adjacencyList, start: 0)
// Output: Visited: 0 → 1 → 2 → 3
```

### Key Points:
- Uses a queue (FIFO order).
- Time Complexity: O(V + E).


## When to Use DFS vs BFS?
- DFS is better for:
    - Exploring all possible paths (e.g., mazes).
    - Detecting cycles.
- BFS is better for:
    - Finding the shortest path in unweighted graphs.
    - Web crawling (level-by-level exploration).

```
Both are essential tools in your algorithm toolbox! 🔧
```
