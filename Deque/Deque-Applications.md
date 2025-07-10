# Other Deque Applications

## 1. Palindrome Checker
```swift
func isPalindrome(_ s: String) -> Bool {
    var deque = Deque<Character>()
    let chars = Array(s.lowercased().filter { $0.isLetter || $0.isNumber })
    
    for char in chars {
        deque.addLast(char)
    }
    
    while deque.count > 1 {
        if deque.removeFirst() != deque.removeLast() {
            return false
        }
    }
    return true
}
```

