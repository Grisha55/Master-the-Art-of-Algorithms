// MARK: - 4. Quick Sort

/// Quick Sort
/// Time Complexity: O(n log n) average, O(n^2) worst
/// Space Complexity: O(log n)
///
/// Description:
/// Quick sort picks a pivot and partitions the array into two subarrays:
/// elements less than pivot and greater than pivot. Then it recursively sorts them.
///

func quickSort(_ array: inout [Int], low: Int, high: Int) {
    if low < high {
        let pivotIndex = partition(&array, low: low, high: high)
        quickSort(&array, low: low, high: pivotIndex - 1)
        quickSort(&array, low: pivotIndex + 1, high: high)
    }
}

private func partition(_ array: inout [Int], low: Int, high: Int) -> Int {
    let pivot = array[high]
    var i = low
    for j in low..<high {
        if array[j] < pivot {
            array.swapAt(i, j)
            i += 1
        }
    }
    array.swapAt(i, high)
    return i
}

/// Example: Sorting [10, 7, 8, 9, 1, 5] with pivot 5
/// After partition: [1, 5, 8, 9, 7, 10]
/// Recurse on [1] and [8, 9, 7, 10]
