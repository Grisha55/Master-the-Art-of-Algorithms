// MARK: - 10. Bucket Sort

/// Bucket Sort (for uniformly distributed float numbers between 0 and 1)
/// Time Complexity: O(n + k), where k is the number of buckets
/// Space Complexity: O(n + k)
///
/// Description:
/// Bucket sort divides the input into buckets based on value ranges.
/// Each bucket is sorted individually (often with insertion sort).
///

func bucketSort(_ array: inout [Double]) {
    guard !array.isEmpty else { return }
    let n = array.count
    var buckets = Array(repeating: [Double](), count: n)

    for value in array {
        let index = Int(Double(n) * value)
        buckets[min(index, n - 1)].append(value)
    }

    for i in 0..<n {
        buckets[i].sort()
    }

    array = buckets.flatMap { $0 }
}

/// Example: Sorting [0.42, 0.32, 0.23, 0.52, 0.25, 0.47, 0.51]
/// Step 1: Distribute into buckets
/// Step 2: Sort each bucket
/// Step 3: Concatenate buckets
