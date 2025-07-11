# Binary Search

## What is Binary Search?
Binary search is an efficient algorithm for finding an item in a **sorted** list of items. It works by repeatedly dividing the search interval in half, dramatically reducing the number of elements that need to be checked compared to a linear search.

## Why Use Binary Search?
- **Time Complexity**: O(log n) - much faster than O(n) linear search
- **Efficiency**: Ideal for large datasets
- **Foundation**: Understanding it helps with more advanced algorithms

## How Binary Search Works
1. Start with a sorted array
2. Compare the target value to the middle element
3. If the target is equal, return the index
4. If the target is smaller, search the left half
5. If the target is larger, search the right half
6. Repeat until found or the search space is exhausted

## Swift Implementation (Iterative)
```swift
func binarySearch(_ array: [Int], _ target: Int) -> Int? {
    var low = 0
    var high = array.count - 1
    
    while low <= high {
        let mid = (low + high) / 2
        let guess = array[mid]
        
        if guess == target {
            return mid
        } else if guess < target {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    
    return nil
}

let numbers = [1, 3, 5, 7, 9, 11]
print(binarySearch(numbers, 5)!) // Output: 2
print(binarySearch(numbers, 10)) // Output: nil
```

## Swift Implementation (Recursive)
```swift
func binarySearch(_ array: [Int], _ target: Int, _ low: Int, _ high: Int) -> Int? {
    guard low <= high else { return nil }
    
    let mid = (low + high) / 2
    if array[mid] == target {
        return mid
    } else if array[mid] < target {
        return binarySearch(array, target, mid + 1, high)
    } else {
        return binarySearch(array, target, low, mid - 1)
    }
}

let sortedArray = [2, 4, 6, 8, 10, 12, 14]
print(binarySearch(sortedArray, 8, 0, sortedArray.count - 1)!) // Output: 3
```

## Common Mistakes
1. Forgetting to sort: Binary search only works on sorted arrays
2. Off-by-one errors: Wrong initial high value or loop condition
3. Integer overflow: Using (low + high) / 2 can overflow (better: low + (high - low) / 2)


## Variations of Binary Search
1. Finding first/last occurrence: Modified to handle duplicates
2. Finding insertion position: Where an element would be inserted
3. Search in rotated sorted array: More advanced variation


## Example: Finding First Occurrence
```swift
func firstOccurrence(_ array: [Int], _ target: Int) -> Int? {
    var low = 0
    var high = array.count - 1
    var result: Int? = nil
    
    while low <= high {
        let mid = low + (high - low) / 2
        if array[mid] == target {
            result = mid
            high = mid - 1 // Look left for earlier occurrences
        } else if array[mid] < target {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    
    return result
}

let numsWithDupes = [1, 2, 2, 2, 3, 4, 4, 5]
print(firstOccurrence(numsWithDupes, 2)!) // Output: 1
print(firstOccurrence(numsWithDupes, 4)!) // Output: 5
```

## When to Use Binary Search
- When you need to search in a large sorted collection
- When you need O(log n) time complexity
- When the cost of sorting is amortized over many searches


## Practice Problems
1. Search in rotated sorted array
2. Find peak element
3. Sqrt(x) calculation
4. Find minimum in rotate sorted array
