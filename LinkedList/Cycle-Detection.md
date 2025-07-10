# Cycle Detection (Floyd's Algorithm)

## Problem: Detect loops in linked lists

```swift
extension LinkedList {
    func hasCycle() -> Bool {
        var slow = head
        var fast = head
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next          // Moves 1 step
            fast = fast?.next?.next    // Moves 2 steps
            
            if slow === fast { 
                return true 
            }
        }
        return false
    }
}

// Create a cycle
let cycleList = LinkedList<Int>()
let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

cycleList.head = node1
node1.next = node2
node2.next = node3
node3.next = node1 // Creates cycle

print(cycleList.hasCycle()) // true
```


## How It Works:
1. "Tortoise and Hare" approach
2. Fast pointer moves twice as fast
3. If they meet → cycle exists
4. O(n) time, O(1) space



## Real-World Uses:
- Memory management (reference cycles)
- GPS route checking
- Infinite sequence detection
