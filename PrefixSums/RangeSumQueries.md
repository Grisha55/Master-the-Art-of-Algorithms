# Range Sum Queries

## What are Range Sum Queries?
Range sum queries involve calculating the sum of elements between two indices in an array. This operation is common in many algorithms and problems.

## Naive Approach
The simplest way is to iterate through the range and calculate the sum each time:
```swift
func rangeSum(_ array: [Int], _ l: Int, _ r: Int) -> Int {
    var sum = 0
    for i in l...r {
        sum += array[i]
    }
    return sum
}
```

This has O(n) time complexity per query, which is inefficient for many queries.

## Optimized Approach with Prefix Sums

Using prefix sums, we can answer each query in O(1) time after O(n) preprocessing:
``` swift
class RangeSumQuery {
    private var prefix: [Int]
    
    init(_ array: [Int]) {
        prefix = [0]
        for num in array {
            prefix.append(prefix.last! + num)
        }
    }
    
    func query(_ l: Int, _ r: Int) -> Int {
        return prefix[r + 1] - prefix[l]
    }
}

let rsq = RangeSumQuery([1, 2, 3, 4, 5])
print(rsq.query(1, 3)) // 9 (2+3+4)
print(rsq.query(0, 4)) // 15 (1+2+3+4+5)
```

## When to Use
- When you have many range sum queries on a static array
- When you need to optimize time complexity from O(n) to O(1) per query
- In problems where sum calculations are the bottleneck
