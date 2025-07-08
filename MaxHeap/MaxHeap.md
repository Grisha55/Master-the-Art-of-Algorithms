# MaxHeap: A Beginner-Friendly Guide
A **MaxHeap** is a binary tree where the largest element is at the root, and every parent node is greater than or equal to its children. It’s efficient for accessing and removing the maximum element in **O(1)** and **O(log n)** time, respectively.

## Key Operations
1. **Insertion (`O(log n)`)** – Add a new element while maintaining heap structure.
2. **Extract Max (`O(log n)`)** – Remove and return the largest element.
3. **Peek Max (`O(1)`)** – Get the largest element without removing it.

## Swift Implementation
```swift
struct MaxHeap<T: Comparable> {
    private var elements: [T] = []
    
    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }
    
    // Get the maximum element (root)
    func peek() -> T? { elements.first }
    
    // Insert a new element
    mutating func insert(_ element: T) {
        elements.append(element)
        heapifyUp(from: elements.count - 1)
    }
    
    // Remove and return the largest element
    mutating func extractMax() -> T? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
        let max = elements.removeLast()
        heapifyDown(from: 0)
        return max
    }
    
    // Restore heap property upward
    private mutating func heapifyUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2
        
        while child > 0 && elements[child] > elements[parent] {
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
            
            if leftChild < elements.count && elements[leftChild] > elements[candidate] {
                candidate = leftChild
            }
            if rightChild < elements.count && elements[rightChild] > elements[candidate] {
                candidate = rightChild
            }
            if candidate == parent { return }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
}

// Example Usage:
var maxHeap = MaxHeap<Int>()
maxHeap.insert(5)
maxHeap.insert(3)
maxHeap.insert(8)
print(maxHeap.peek())       // 8
print(maxHeap.extractMax()) // 8
print(maxHeap.peek())       // 5
```


### When to Use?
- **Heap Sort** (sorting in descending order).
- **Priority Queues** where the largest element has the highest priority



## Heap Sort in Swift (Descending Order)
Heap Sort is an efficient comparison-based sorting algorithm that uses a binary heap data structure. Here's a complete implementation in Swift that sorts elements in descending order, with detailed explanations for beginners.

### How Heap Sort Works (for Descending Order)
1. **Build a Max-Heap**: Transform the array into a max-heap (parent nodes ≥ children)
2. **Sort Phase**:
    - Swap the root (max element) with the last item
    - Reduce heap size by 1
    - Heapify the new root to maintain max-heap property
3. **Repeat** until the heap contains only one element


### Complete Swift Implementation
```swift
/// Heap Sort (Descending Order)
func heapSortDescending<T: Comparable>(_ array: inout [T]) {
    let n = array.count
    
    // 1. Build Max-Heap (start from last parent node)
    for i in stride(from: n/2 - 1, through: 0, by: -1) {
        maxHeapify(&array, heapSize: n, rootIndex: i)
    }
    
    // 2. Extraction phase
    for i in stride(from: n - 1, through: 1, by: -1) {
        array.swapAt(0, i) // Move max to end
        maxHeapify(&array, heapSize: i, rootIndex: 0) // Heapify reduced heap
    }
}

/// Maintains max-heap property (parent ≥ children)
private func maxHeapify<T: Comparable>(_ array: inout [T], heapSize: Int, rootIndex: Int) {
    let leftChild = 2 * rootIndex + 1
    let rightChild = 2 * rootIndex + 2
    var largest = rootIndex
    
    // Compare with left child
    if leftChild < heapSize && array[leftChild] > array[largest] {
        largest = leftChild
    }
    
    // Compare with right child
    if rightChild < heapSize && array[rightChild] > array[largest] {
        largest = rightChild
    }
    
    // If largest isn't root, swap and continue heapifying
    if largest != rootIndex {
        array.swapAt(rootIndex, largest)
        maxHeapify(&array, heapSize: heapSize, rootIndex: largest)
    }
}
```

### Step-by-Step Explanation
1. Building the Max-Heap
```swift
for i in stride(from: n/2 - 1, through: 0, by: -1) {
    maxHeapify(&array, heapSize: n, rootIndex: i)
}
```
- Starts from the last parent node (n/2 - 1)
- Moves upward to the root
- Ensures each subtree satisfies max-heap property

2. Sorting Phase
```swift
for i in stride(from: n - 1, through: 1, by: -1) {
    array.swapAt(0, i)
    maxHeapify(&array, heapSize: i, rootIndex: 0)
}
```
- Each iteration:
    - Swaps root (max element) with last unsorted element
    - Reduces heap size by 1
    - Restores heap property for new root

3. Max-Heapify Function
```swift
if leftChild < heapSize && array[leftChild] > array[largest] {
    largest = leftChild
}
```
- Compares parent with left child
- Updates `largest` if child is bigger
```swift
if largest != rootIndex {
    array.swapAt(rootIndex, largest)
    maxHeapify(&array, heapSize: heapSize, rootIndex: largest)
}
```
- Recursively fixes the affected subtree


## Example Usage
```swift
var numbers = [12, 11, 13, 5, 6, 7]
heapSortDescending(&numbers)
print(numbers) // [13, 12, 11, 7, 6, 5]

var words = ["apple", "banana", "cherry", "date"]
heapSortDescending(&words)
print(words) // ["date", "cherry", "banana", "apple"]
```


## Key Characteristics
- **Time Complexity**: O(n log n) in all cases
- **Space Complexity**: O(1) (in-place)
- **Unstable Sort**: May change order of equal elements
- **Best For**: Large datasets where O(n log n) is acceptable



## Visual Example (Step-by-Step)
```
Initial: [3, 1, 4, 1, 5, 9, 2]

Build Max-Heap:
      5
    /   \
   4     9
  / \   / \
 1   1 3   2

Sorting:
1. Swap 9 (root) with 2 (last)
2. Heapify [2,4,5,1,1,3] → 5 becomes root
3. Swap 5 with 3 → Continue until sorted

Result: [9, 5, 4, 3, 2, 1, 1]
```

This implementation efficiently sorts any Comparable type in descending order while maintaining clarity for learning purposes.
