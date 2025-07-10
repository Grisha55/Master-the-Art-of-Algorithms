# Doubly Linked List

## What's Different?
Each node has:
- **Value**
- **Next** pointer
- **Previous** pointer

```swift
class DoublyNode<T> {
    var value: T
    var next: DoublyNode?
    weak var prev: DoublyNode? // Prevent retain cycles
    
    init(value: T, next: DoublyNode? = nil, prev: DoublyNode? = nil) {
        self.value = value
        self.next = next
        self.prev = prev
    }
}

class DoublyLinkedList<T> {
    var head: DoublyNode<T>?
    var tail: DoublyNode<T>?
    
    // Add to front (O(1))
    func prepend(_ value: T) {
        let newNode = DoublyNode(value: value, next: head)
        head?.prev = newNode
        head = newNode
        if tail == nil { tail = head }
    }
    
    // Remove last (O(1))
    func removeLast() -> T? {
        guard let tail = tail else { return nil }
        let value = tail.value
        tail.prev?.next = nil
        self.tail = tail.prev
        return value
    }
}

// Usage
let dList = DoublyLinkedList<String>()
dList.prepend("World")
dList.prepend("Hello") 
dList.removeLast() // Returns "World"
```


## Advantages:
- Can traverse backwards
- O(1) removal from both ends
- Better for certain algorithms (e.g., LRU Cache)
