# MinHeap in Swift: A Beginner-Friendly Guide

A **MinHeap** is a binary tree where the smallest element is always at the root, and every parent node is smaller than or equal to its children. It’s efficient for accessing and removing the minimum element in **O(1)** and **O(log n)** time, respectively.

## Key Operations
1. **Insertion (`O(log n)`)** – Add a new element while maintaining heap structure.
2. **Extract Min (`O(log n)`)** – Remove and return the smallest element.
3. **Peek Min (`O(1)`)** – Get the smallest element without removing it.

## Swift Implementation
```swift
struct MinHeap<T: Comparable> {
    private var elements: [T] = []
    
    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }
    
    // Get the minimum element (root)
    func peek() -> T? { elements.first }
    
    // Insert a new element
    mutating func insert(_ element: T) {
        elements.append(element)
        heapifyUp(from: elements.count - 1)
    }
    
    // Remove and return the smallest element
    mutating func extractMin() -> T? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
        let min = elements.removeLast()
        heapifyDown(from: 0)
        return min
    }
    
    // Restore heap property upward
    private mutating func heapifyUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2
        
        while child > 0 && elements[child] < elements[parent] {
            elements.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    // Restore heap property downward
    private mutating func heapifyDown(from index: Int) {
        var parent = index
        while true {
            let leftChild = 2 * parent + 1
            let rightChild = 2 * parent + 2
            var candidate = parent
            
            if leftChild < elements.count && elements[leftChild] < elements[candidate] {
                candidate = leftChild
            }
            if rightChild < elements.count && elements[rightChild] < elements[candidate] {
                candidate = rightChild
            }
            if candidate == parent { return }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
}

// Example Usage:
var minHeap = MinHeap<Int>()
minHeap.insert(5)
minHeap.insert(3)
minHeap.insert(8)
print(minHeap.peek())       // 3
print(minHeap.extractMin()) // 3
print(minHeap.peek())       // 5
```

### When to use?
- Dijkstra’s Algorithm (finding shortest paths).
- Scheduling tasks where the smallest element has the highest priority.


## Dijkstra’s Algorithm in Swift (Finding Shortest Paths)
Dijkstra’s algorithm is a greedy algorithm that finds the shortest path from a **starting node** to all other nodes in **a weighted graph** (with non-negative edge weights). It’s widely used in:
- GPS navigation (shortest route finding).
- Network routing protocols.
- Traffic management systems.


## How Dijkstra’s Algorithm Works
1. **Initialize distances:** Set the distance to the start node as 0 and all other nodes as ∞.
2. **Priority Queue** (Min-Heap): Keeps track of the next node to visit based on the shortest known distance.
3. **Process Nodes:**
    - Extract the node with the smallest current distance.
    - Relax its neighbors (update distances if a shorter path is found).
4. **Repeat** until all nodes are processed.


## Swift Implementation
**We’ll use:**
- A MinHeap (Priority Queue) to efficiently fetch the next closest node.
- A distance dictionary to store the shortest known distances.
- A graph representation using an adjacency list.


### 1. Graph Representation (Adjacency List)
```swift
typealias Edge = (destination: Int, weight: Int)
typealias AdjacencyList = [Int: [Edge]]

// Example: Graph where edges are stored as [source: [(destination, weight)]]
let graph: AdjacencyList = [
    0: [(1, 4), (2, 1)],
    1: [(3, 1)],
    2: [(1, 2), (3, 5)],
    3: []
]
```

### 2. MinHeap for Efficient Node Extraction
```swift
struct MinHeap<T: Comparable> {
    private var elements: [(node: Int, distance: T)] = []
    
    var isEmpty: Bool { elements.isEmpty }
    
    mutating func insert(_ node: Int, _ distance: T) {
        elements.append((node, distance))
        heapifyUp(from: elements.count - 1)
    }
    
    mutating func extractMin() -> (node: Int, distance: T)? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
        let min = elements.removeLast()
        heapifyDown(from: 0)
        return min
    }
    
    private mutating func heapifyUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2
        while child > 0 && elements[child].distance < elements[parent].distance {
            elements.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    private mutating func heapifyDown(from index: Int) {
        var parent = index
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var candidate = parent
            if left < elements.count && elements[left].distance < elements[candidate].distance {
                candidate = left
            }
            if right < elements.count && elements[right].distance < elements[candidate].distance {
                candidate = right
            }
            if candidate == parent { return }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
}
```

### 3. Dijkstra’s Algorithm
```swift
func dijkstra(graph: AdjacencyList, start: Int) -> [Int: Int] {
    var distances = [Int: Int]()
    var priorityQueue = MinHeap<Int>()
    
    // Initialize distances: start node = 0, others = ∞
    for node in graph.keys {
        distances[node] = (node == start) ? 0 : Int.max
    }
    
    priorityQueue.insert(start, 0)
    
    while let (currentNode, currentDistance) = priorityQueue.extractMin() {
        // Skip if we already found a better path
        if currentDistance > distances[currentNode]! { continue }
        
        // Relax all neighboring edges
        for edge in graph[currentNode] ?? [] {
            let neighbor = edge.destination
            let weight = edge.weight
            let newDistance = currentDistance + weight
            
            // If a shorter path is found, update and enqueue
            if newDistance < distances[neighbor]! {
                distances[neighbor] = newDistance
                priorityQueue.insert(neighbor, newDistance)
            }
        }
    }
    
    return distances
}
```

### 4. Example Usage
```swift
let shortestPaths = dijkstra(graph: graph, start: 0)
print(shortestPaths) // [0: 0, 1: 3, 2: 1, 3: 4]
```

### Output Explanation:
- `0 → 0` (distance to itself is `0`).
- `0 → 2 → 1` (total weight = `1 + 2 = 3`).
- `0 → 2` (direct edge, weight `1`).
- `0 → 2 → 1 → 3` (total weight = `1 + 2 + 1 = 4`).


## Time Complexity:
- **O((V + E) log V)**, where:
    - V = number of vertices (nodes).
    - E = number of edges.
- The **MinHeap** ensures efficient extraction of the next closest node.


## When to Use Dijkstra's Algorithm?
✅ Weighted graphs with non-negative edges.  
✅ Finding the shortest path from a single source.  
❌ Negative edge weights? → Use Bellman-Ford instead.  


## Final Thoughts
Dijkstra’s algorithm is a fundamental graph algorithm that combines greedy selection with priority queues for efficiency. This Swift implementation provides a clear, step-by-step approach to solving shortest-path problems. 🚀
