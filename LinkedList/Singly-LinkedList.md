# Singly Linked List

## What is it?
A chain of nodes where each node contains:
- **Value** (your data)
- **Next** pointer (reference to next node)

```swift
class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

class LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    // Add to end (O(1))
    func append(_ value: T) {
        let newNode = Node(value: value)
        
        if let tail = tail {
            tail.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    // Print all elements (O(n))
    func printList() {
        var current = head
        while let node = current {
            print(node.value, terminator: " -> ")
            current = node.next
        }
        print("nil")
    }
}

// Usage
let list = LinkedList<Int>()
list.append(1)
list.append(2)
list.append(3)
list.printList() // 1 -> 2 -> 3 -> nil
```


## Key Features:
- Insert at head: O(1)
- Insert at tail: O(1) (with tail pointer)
- Search: O(n)
- No random access - must traverse from head
