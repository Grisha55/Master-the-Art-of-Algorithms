# **3-Examples-of-Recursion.md**


## **1. Fibonacci Sequence**  
```swift
func fibonacci(_ n: Int) -> Int {
    if n <= 1 {  // Base case
        return n
    }
    return fibonacci(n - 1) + fibonacci(n - 2)  // Recursive case
}
print(fibonacci(6)) // Output: 8 (0, 1, 1, 2, 3, 5, 8)
```

## **2. Binary Search (Recursive Approach)**
```swift
func binarySearch(_ array: [Int], _ target: Int, _ low: Int, _ high: Int) -> Int? {
    if low > high {  // Base case: Not found
        return nil
    }
    let mid = (low + high) / 2
    if array[mid] == target {
        return mid  // Base case: Found
    } else if array[mid] < target {
        return binarySearch(array, target, mid + 1, high)  // Recursive case: Right half
    } else {
        return binarySearch(array, target, low, mid - 1)  // Recursive case: Left half
    }
}
```

## **3. Countdown Timer**
```swift
func countdown(_ n: Int) {
    if n <= 0 {  // Base case
        print("Blast off!")
    } else {
        print(n)
        countdown(n - 1)  // Recursive case
    }
}
countdown(3)
```
