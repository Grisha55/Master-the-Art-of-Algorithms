
# Priority Queues: A Beginner-Friendly Guide

A **Priority Queue** is a data structure where elements are dequeued based on priority (either **min-first** or **max-first**). It’s commonly implemented using a **Heap** for efficiency.

## Key Operations
1. **Enqueue (`O(log n)`)** – Insert an element with a priority.
2. **Dequeue (`O(log n)`)** – Remove and return the highest-priority element.
3. **Peek (`O(1)`)** – Check the highest-priority element without removal.

## Swift Implementation (Using MinHeap)
```swift
struct PriorityQueue<T: Comparable> {
    private var heap: MinHeap<T>
    
    init() {
        heap = MinHeap()
    }
    
    var isEmpty: Bool { heap.isEmpty }
    var count: Int { heap.count }
    
    // Insert an element
    mutating func enqueue(_ element: T) {
        heap.insert(element)
    }
    
    // Remove and return the highest-priority element
    mutating func dequeue() -> T? {
        return heap.extractMin()
    }
    
    // Peek at the highest-priority element
    func peek() -> T? {
        return heap.peek()
    }
}

// Example Usage:
var pq = PriorityQueue<Int>()
pq.enqueue(10)
pq.enqueue(5)
pq.enqueue(20)
print(pq.peek())      // 5
print(pq.dequeue())   // 5
print(pq.peek())      // 10
```


## Max-Priority Queue (Using MaxHeap)
```swift
struct MaxPriorityQueue<T: Comparable> {
    private var heap: MaxHeap<T>
    
    init() {
        heap = MaxHeap()
    }
    
    mutating func enqueue(_ element: T) {
        heap.insert(element)
    }
    
    mutating func dequeue() -> T? {
        return heap.extractMax()
    }
    
    func peek() -> T? {
        return heap.peek()
    }
}
```


## When to Use?
- Task Scheduling (e.g., CPU task prioritization).
- Graph Algorithms like Prim’s MST and Dijkstra’s.
- Event-driven simulations (processing events by priority).

```
Priority queues are a powerful tool for managing ordered data efficiently! 🚀
```


## Prim's Minimum Spanning Tree (MST) Algorithm in Swift
Prim's algorithm is a greedy algorithm that finds a minimum spanning tree for a weighted undirected graph. This implementation includes detailed explanations for beginners and uses Swift's native data structures.

### Key Concepts
1. **Minimum Spanning Tree** (MST): A subset of edges that connects all vertices with the minimal total edge weight
2. **Greedy Approach**: At each step, we select the cheapest edge that expands the MST
3. **Data Structures**:
    - Priority Queue (Min-Heap) to efficiently select the next edge
    - Visited set to track included vertices
    - Dictionary to store the minimum edge weights


###Complete Implementation
```swift
import Foundation

// Edge structure to represent graph connections
struct Edge: Comparable {
    let from: Int
    let to: Int
    let weight: Int
    
    static func < (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.weight < rhs.weight
    }
}

// Graph representation using adjacency list
typealias AdjacencyList = [Int: [Edge]]

// Priority Queue (Min-Heap) implementation for Prim's algorithm
struct PriorityQueue<T: Comparable> {
    private var elements: [T] = []
    
    var isEmpty: Bool { elements.isEmpty }
    
    mutating func enqueue(_ value: T) {
        elements.append(value)
        heapifyUp(from: elements.count - 1)
    }
    
    mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
        let min = elements.removeLast()
        heapifyDown(from: 0)
        return min
    }
    
    private mutating func heapifyUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2
        
        while child > 0 && elements[child] < elements[parent] {
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
            
            if left < elements.count && elements[left] < elements[candidate] {
                candidate = left
            }
            if right < elements.count && elements[right] < elements[candidate] {
                candidate = right
            }
            if candidate == parent { return }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
}

// Prim's MST Algorithm
func primMST(graph: AdjacencyList, startVertex: Int = 0) -> [Edge] {
    var mstEdges: [Edge] = []
    var visited = Set<Int>()
    var priorityQueue = PriorityQueue<Edge>()
    
    // Mark the starting vertex as visited
    visited.insert(startVertex)
    
    // Add all edges from the starting vertex to the priority queue
    if let edges = graph[startVertex] {
        for edge in edges {
            priorityQueue.enqueue(edge)
        }
    }
    
    while !priorityQueue.isEmpty {
        guard let minEdge = priorityQueue.dequeue() else { break }
        
        // If we haven't visited the destination vertex yet
        if !visited.contains(minEdge.to) {
            visited.insert(minEdge.to)
            mstEdges.append(minEdge)
            
            // Add all edges from the new vertex to the priority queue
            if let edges = graph[minEdge.to] {
                for edge in edges {
                    if !visited.contains(edge.to) {
                        priorityQueue.enqueue(edge)
                    }
                }
            }
        }
    }
    
    return mstEdges
}
```


## Step-by-Step Explanation
1. **Graph Representation**

We use an adjacency list where:
- Each vertex maps to an array of `Edge` structures
- Each `Edge` contains `from`, `to`, and `weight` properties

2. **Priority Queue** (Min-Heap)
This helps efficiently retrieve the minimum weight edge at each step:
- `enqueue`: Adds an element while maintaining heap property
- `dequeue`: Removes and returns the minimum element
- `heapifyUp/Down`: Maintains the heap structure after operations

3. **Prim's Algorithm Steps**
    1. **Initialization**:
        - Start with any vertex (default is 0)
        - Mark it as visited
        - Add all its edges to the priority queue
    2. Main Loop:
        - Extract the minimum weight edge from the queue
        - If it connects to an unvisited vertex:
            - Add the edge to MST
            - Mark the new vertex as visited
            - Add its edges to the queue

    3. **Termination**:
        - Stops when the queue is empty
        - Returns all edges in the MST


## Example Usage
```swift
// Create a sample graph
var graph: AdjacencyList = [
    0: [Edge(from: 0, to: 1, weight: 4),
        Edge(from: 0, to: 2, weight: 1)],
    1: [Edge(from: 1, to: 0, weight: 4),
        Edge(from: 1, to: 2, weight: 2),
        Edge(from: 1, to: 3, weight: 1)],
    2: [Edge(from: 2, to: 0, weight: 1),
        Edge(from: 2, to: 1, weight: 2),
        Edge(from: 2, to: 3, weight: 5)],
    3: [Edge(from: 3, to: 1, weight: 1),
        Edge(from: 3, to: 2, weight: 5)]
]

// Find MST
let mst = primMST(graph: graph)

// Print results
print("Minimum Spanning Tree Edges:")
for edge in mst {
    print("\(edge.from) --(\(edge.weight))--> \(edge.to)")
}
```


## Output Explanation
For the sample graph:
```
Minimum Spanning Tree Edges:
0 --(1)--> 2
2 --(2)--> 1
1 --(1)--> 3
```
This represents the MST with total weight = 1 + 2 + 1 = 4



## Complexity Analysis
- **Time Complexity**: O(E log V)
    - Each edge is processed once (O(E))
    - Priority queue operations take O(log V) each
- **Space Complexity**: O(V + E)
    - Stores the graph and priority queue



## Visual Representation
```
Initial Graph:
      4
  0-------1
  | \   / |
1 |  \/  | 1
  | /  \ |
  2-------3
      5

MST:
      1
  0-------2
          |
          | 1
          |
          3
```


## Key Points for Beginners
1. **Why Min-Heap?**
    - We always want the next cheapest edge
    - Heap gives us O(1) access to minimum element

2. **Visited Set Purpose**
    - Ensures we don't create cycles
    - Tracks which vertices are already in MST

3. **Undirected Graph Handling**
    - Each edge appears twice in adjacency list
    - (0→1) and (1→0) are the same edge

4. **Greedy Property**
    - At each step, we make the locally optimal choice
    - This leads to the globally optimal solution
