# Tree-Based Algorithms

## 1. Binary Search Tree (BST) Operations
A BST is a binary tree where:
- Left subtree values < root value.
- Right subtree values > root value.

### Search (`O(log n)` in balanced BST)
```swift
func search(_ root: Node<Int>?, _ value: Int) -> Bool {
    guard let root = root else { return false }
    if root.value == value { return true }
    return value < root.value ? 
        search(root.left, value) : 
        search(root.right, value)
}
```

### Insertion
```swift
func insert(_ root: Node<Int>?, _ value: Int) -> Node<Int> {
    guard let root = root else { return Node(value: value) }
    if value < root.value {
        root.left = insert(root.left, value)
    } else if value > root.value {
        root.right = insert(root.right, value)
    }
    return root
}
```

## 2. AVL Tree (Balanced BST)
Self-balancing BST where height difference between subtrees ≤ 1.

### Rotations (LL, RR, LR, RL)
```swift
// Left-Left (LL) Rotation
// When: Left subtree of the left child is heavier (Right-Imbalanced).
// Action: Single right rotation.
func rightRotate(_ y: Node<Int>) -> Node<Int> {
    let x = y.left!
    let T2 = x.right
    
    // Perform rotation
    x.right = y
    y.left = T2
    
    // Update heights (assuming height is stored in the node)
    y.height = max(height(y.left), height(y.right)) + 1
    x.height = max(height(x.left), height(x.right)) + 1
    
    return x
}
```

```swift
// Right-Right (RR) Rotation
// When: Right subtree of the right child is heavier (Left-Imbalanced).
// Action: Single left rotation.
func leftRotate(_ x: Node<Int>) -> Node<Int> {
    let y = x.right!
    let T2 = y.left
    
    // Perform rotation
    y.left = x
    x.right = T2
    
    // Update heights
    x.height = max(height(x.left), height(x.right)) + 1
    y.height = max(height(y.left), height(y.right)) + 1
    
    return y
}
```

```swift
// Left-Right (LR) Rotation
// When: Right subtree of the left child is heavier.
// Action: Left rotation on left child, then right rotation on root.
func leftRightRotate(_ z: Node<Int>) -> Node<Int> {
    z.left = leftRotate(z.left!)
    return rightRotate(z)
}
```

```swift
// Right-Left (RL) Rotation
// When: When: Left subtree of the right child is heavier.
// Action: Right rotation on right child, then left rotation on root.
func rightLeftRotate(_ z: Node<Int>) -> Node<Int> {
    z.right = rightRotate(z.right!)
    return leftRotate(z)
}
```

## Full AVL insertion with Rotations
```swift
class Node<T: Comparable> {
    var value: T
    var left: Node?
    var right: Node?
    var height: Int = 1
    
    init(value: T) {
        self.value = value
    }
}

func height<T>(_ node: Node<T>?) -> Int {
    return node?.height ?? 0
}

func balanceFactor<T>(_ node: Node<T>?) -> Int {
    return height(node?.left) - height(node?.right)
}

func insert<T>(_ root: Node<T>?, _ value: T) -> Node<T> {
    guard let root = root else {
        return Node(value: value)
    }
    
    if value < root.value {
        root.left = insert(root.left, value)
    } else if value > root.value {
        root.right = insert(root.right, value)
    } else {
        return root  // Duplicates not allowed
    }
    
    // Update height
    root.height = 1 + max(height(root.left), height(root.right))
    
    // Check balance
    let balance = balanceFactor(root)
    
    // LL Case
    if balance > 1 && value < root.left!.value {
        return rightRotate(root)
    }
    
    // RR Case
    if balance < -1 && value > root.right!.value {
        return leftRotate(root)
    }
    
    // LR Case
    if balance > 1 && value > root.left!.value {
        root.left = leftRotate(root.left!)
        return rightRotate(root)
    }
    
    // RL Case
    if balance < -1 && value < root.right!.value {
        root.right = rightRotate(root.right!)
        return leftRotate(root)
    }
    
    return root
}
```

## 3. Heap (Priority Queue)
A complete binary tree where:
    - Min-Heap: Parent ≤ children.
    - Max-Heap: Parent ≥ children.

### Swift Implementation
```swift
struct Heap<T: Comparable> {
    private var elements: [T] = []
    private let isMinHeap: Bool

    init(isMinHeap: Bool = true) {
        self.isMinHeap = isMinHeap
    }

    mutating func insert(_ value: T) {
        elements.append(value)
        heapifyUp(from: elements.count - 1)
    }

    private mutating func heapifyUp(from index: Int) {
        let parent = (index - 1) / 2
        if shouldSwap(child: index, parent: parent) {
            elements.swapAt(index, parent)
            heapifyUp(from: parent)
        }
    }

    private func shouldSwap(child: Int, parent: Int) -> Bool {
        isMinHeap ? elements[child] < elements[parent] : elements[child] > elements[parent]
    }
}
```
