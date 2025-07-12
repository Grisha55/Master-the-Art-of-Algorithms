# **7. Common Recursion Problems**  

## **1. Reverse a String**  
```swift
func reverse(_ s: String) -> String {
    if s.isEmpty { return s }  // Base case
    return String(s.last!) + reverse(String(s.dropLast()))  // Recursive case
}
```

## **2. Power Function**
```swift
func power(_ x: Int, _ n: Int) -> Int {
    if n == 0 { return 1 }  // Base case
    return x * power(x, n - 1)
}
```

## **3. Tree Traversals (DFS)**
``` swift
class TreeNode {
    var value: Int
    var left: TreeNode?
    var right: TreeNode?
}

func inorderTraversal(_ node: TreeNode?) {
    guard let node = node else { return }
    inorderTraversal(node.left)
    print(node.value)
    inorderTraversal(node.right)
}
```
