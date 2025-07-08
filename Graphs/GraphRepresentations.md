# Graph Representations: Adjacency List and Adjacency Matrix

Graphs are fundamental data structures used to represent relationships between objects. There are two common ways to represent graphs in code: **Adjacency List** and **Adjacency Matrix**. Let's explore both with Swift examples.

## 1. Adjacency List
An adjacency list stores each node along with a list of its neighboring nodes. It's memory-efficient for sparse graphs.

### Swift Implementation:
```swift
class Graph {
    var adjacencyList: [Int: [Int]] = [:]
    
    func addEdge(_ u: Int, _ v: Int) {
        if adjacencyList[u] == nil {
            adjacencyList[u] = []
        }
        adjacencyList[u]?.append(v)
        
        // For undirected graphs, add the reverse edge
        if adjacencyList[v] == nil {
            adjacencyList[v] = []
        }
        adjacencyList[v]?.append(u)
    }
}

// Example usage:
let graph = Graph()
graph.addEdge(0, 1)
graph.addEdge(0, 2)
graph.addEdge(1, 3)
print(graph.adjacencyList) // [0: [1, 2], 1: [0, 3], 2: [0], 3: [1]]
```

### Pros:
- Efficient in space for sparse graphs.
- Easy to iterate over neighbors.

### Cons:
- Slower to check if an edge exists (O(k), where k is the number of neighbors).


## 2. Adjacency Matrix
An adjacency matrix is a 2D array where `matrix[u][v]` indicates if there's an edge between nodes `u` and `v`. It's better for dense graphs.

### Swift Implementation:
```swift
class Graph {
    var adjacencyMatrix: [[Int]]
    let numNodes: Int
    
    init(numNodes: Int) {
        self.numNodes = numNodes
        self.adjacencyMatrix = Array(repeating: Array(repeating: 0, count: numNodes), count: numNodes)
    }
    
    func addEdge(_ u: Int, _ v: Int) {
        adjacencyMatrix[u][v] = 1
        adjacencyMatrix[v][u] = 1 // For undirected graphs
    }
}

// Example usage:
let graph = Graph(numNodes: 4)
graph.addEdge(0, 1)
graph.addEdge(0, 2)
graph.addEdge(1, 3)
print(graph.adjacencyMatrix)
/*
[
    [0, 1, 1, 0],
    [1, 0, 0, 1],
    [1, 0, 0, 0],
    [0, 1, 0, 0]
]
*/
```

### Pros:
- Fast edge lookup (O(1)).
- Simple implementation.

### Cons:
- Consumes more memory (O(n²)).


## When to Use Which?
- Use Adjacency List for sparse graphs (few edges).
- Use Adjacency Matrix for dense graphs (many edges) or when fast edge queries are needed.

```
Now you can choose the best representation for your problem! 🚀
```
