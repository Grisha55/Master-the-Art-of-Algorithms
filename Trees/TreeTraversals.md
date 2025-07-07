# Tree Traversals: Visiting Every Node

Traversals systematically visit all nodes in a tree. The three main types:

## 1. Inorder Traversal (Left-Root-Right)
1. Traverse the left subtree.
2. Visit the root.
3. Traverse the right subtree.

**Use Case**: Returns nodes in ascending order in BSTs.

## 2. Preorder Traversal (Root-Left-Right)
1. Visit the root.
2. Traverse the left subtree.
3. Traverse the right subtree.

**Use Case**: Copying a tree or prefix expressions.

## 3. Postorder Traversal (Left-Right-Root)
1. Traverse the left subtree.
2. Traverse the right subtree.
3. Visit the root.

**Use Case**: Deleting a tree (post-order ensures children are processed before parents).

## Swift Implementation
```swift
func inorderTraversal(_ node: Node<Int>?) {
    guard let node = node else { return }
    inorderTraversal(node.left)
    print(node.value)
    inorderTraversal(node.right)
}

func preorderTraversal(_ node: Node<Int>?) {
    guard let node = node else { return }
    print(node.value)
    preorderTraversal(node.left)
    preorderTraversal(node.right)
}

func postorderTraversal(_ node: Node<Int>?) {
    guard let node = node else { return }
    postorderTraversal(node.left)
    postorderTraversal(node.right)
    print(node.value)
}

// Usage
let root = Node(value: 1)
root.left = Node(value: 2)
root.right = Node(value: 3)

print("Inorder:")
inorderTraversal(root) // 2, 1, 3

print("Preorder:")
preorderTraversal(root) // 1, 2, 3

print("Postorder:")
postorderTraversal(root) // 2, 3, 1
