// MARK: - 7. Min Heap Sort

/// Min Heap Sort (produces descending order)
/// Time Complexity: O(n log n)
/// Space Complexity: O(1)
///
/// Description:
/// Min heap sort builds a min heap and repeatedly removes the smallest element
/// (at the root), swaps it to the end, and heapifies.
/// To sort ascending, reverse the array in the end.
///

func heapSortMin(_ array: inout [Int]) {
    let n = array.count
    for i in stride(from: n / 2 - 1, through: 0, by: -1) {
        minHeapify(&array, n, i)
    }
    for i in stride(from: n - 1, through: 1, by: -1) {
        array.swapAt(0, i)
        minHeapify(&array, i, 0)
    }
    array.reverse() // To make it ascending
}

private func minHeapify(_ array: inout [Int], _ n: Int, _ i: Int) {
    var smallest = i
    let left = 2 * i + 1
    let right = 2 * i + 2
    if left < n && array[left] < array[smallest] {
        smallest = left
    }
    if right < n && array[right] < array[smallest] {
        smallest = right
    }
    if smallest != i {
        array.swapAt(i, smallest)
        minHeapify(&array, n, smallest)
    }
}

/// Example: [5, 3, 8, 4, 1, 2] -> build min heap -> [1, 3, 2, 4, 5, 8]
/// Delete minimum and rebuild the heap
/*
 [1, 3, 2, 4, 5, 8] → [2, 3, 8, 4, 5] → [2, 3, 8, 4, 5]
 [2, 3, 8, 4, 5]    → [5, 3, 8, 4]    → [3, 4, 8, 5]
 [3, 4, 8, 5]       → [5, 4, 8]       → [4, 5, 8]
 [4, 5, 8]          → [8, 5]          → [5, 8]
 [5, 8]             → [8]             → [8]
 [8]                → []              → []

 */
/// Result: [1, 2, 3, 4, 5, 8]

