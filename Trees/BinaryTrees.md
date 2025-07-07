# Binary Trees: Structure and Basics

## What is a Binary Tree?
A **binary tree** is a hierarchical data structure where each node has at most two children: the **left child** and the **right child**. The topmost node is called the **root**.

### Key Terminology:
- **Node**: An element storing data and references to its children.
- **Root**: The top node (no parent).
- **Leaf**: A node with no children.
- **Depth**: Number of edges from the root to a node.
- **Height**: Maximum depth of the tree.

## Types of Binary Trees
1. **Full Binary Tree**: Every node has 0 or 2 children.
2. **Complete Binary Tree**: All levels are fully filled except possibly the last, filled left to right.
3. **Perfect Binary Tree**: All interior nodes have two children, and all leaves are at the same level.
4. **Balanced Binary Tree**: Height difference between left and right subtrees ≤ 1 (e.g., AVL trees).

## Why Use Binary Trees?
- Efficient searching (`O(log n)` in balanced trees).
- Hierarchical data representation (e.g., file systems).
- Foundation for advanced structures (BSTs, Heaps).

## Example in Swift
```swift
class Node<T> {
    var value: T
    var left: Node?
    var right: Node?

    init(value: T) {
        self.value = value
    }
}

// Create a binary tree
let root = Node(value: 1)
root.left = Node(value: 2)
root.right = Node(value: 3)
root.left?.left = Node(value: 4)
