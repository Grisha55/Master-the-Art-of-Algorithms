// MARK: - 6. Max Heap Sort

/// Max Heap Sort
/// Time Complexity: O(n log n)
/// Space Complexity: O(1)
///
/// Description:
/// Max heap sort builds a max heap, then repeatedly swaps the first and last
/// element and heapifies the reduced heap.
///

func heapSortMax(_ array: inout [Int]) {
    let n = array.count
    for i in stride(from: n / 2 - 1, through: 0, by: -1) {
        maxHeapify(&array, n, i)
    }
    for i in stride(from: n - 1, through: 1, by: -1) {
        array.swapAt(0, i)
        maxHeapify(&array, i, 0)
    }
}

private func maxHeapify(_ array: inout [Int], _ n: Int, _ i: Int) {
    var largest = i
    let left = 2 * i + 1
    let right = 2 * i + 2
    if left < n && array[left] > array[largest] {
        largest = left
    }
    if right < n && array[right] > array[largest] {
        largest = right
    }
    if largest != i {
        array.swapAt(i, largest)
        maxHeapify(&array, n, largest)
    }
}

/// Example: [4, 10, 3, 5, 1] -> build max heap -> [10, 5, 3, 4, 1]
/// Extract 10, reheapify, repeat
