# Deque (Double-Ended Queue) - Basics

## What is a Deque?
A **deque** (pronounced "deck") is a queue where you can **add/remove items from both front and back**. Think of it like a hybrid between a stack and a queue.

### Key Operations:
- `addFirst(_:)` - Insert at front
- `addLast(_:)` - Insert at back
- `removeFirst()` - Remove from front
- `removeLast()` - Remove from back

## Swift Implementation
```swift
struct Deque<T> {
    private var array: [T] = []
    
    mutating func addFirst(_ element: T) {
        array.insert(element, at: 0)
    }
    
    mutating func addLast(_ element: T) {
        array.append(element)
    }
    
    mutating func removeFirst() -> T? {
        return array.isEmpty ? nil : array.removeFirst()
    }
    
    mutating func removeLast() -> T? {
        return array.isEmpty ? nil : array.removeLast()
    }
    
    func peekFirst() -> T? {
        return array.first
    }
    
    func peekLast() -> T? {
        return array.last
    }
}

// Example Usage
var deque = Deque<Int>()
deque.addLast(1)  // [1]
deque.addFirst(2) // [2, 1]
deque.removeLast() // Returns 1
```

## When to Use?
- When you need O(1) access at both ends
- More flexible than a regular queue/stack
