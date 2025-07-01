// MARK: - 1. Insertion Sort

/// Insertion Sort
/// Time Complexity: O(n^2) average and worst case, O(n) best case (already sorted)
/// Space Complexity: O(1)
///
/// Description:
/// Insertion sort builds the sorted array one element at a time by repeatedly
/// inserting the current element into its correct position in the already-sorted part.

func insertionSort(_ array: inout [Int]) {
    for i in 1..<array.count {
        var j = i
        while j > 0 && array[j] < array[j - 1] {
            array.swapAt(j, j - 1)
            j -= 1
        }
    }
}

/// Example: Sorting [5, 2, 4, 6]
/// Step 1: [2, 5, 4, 6]
/// Step 2: [2, 4, 5, 6]
/// Step 3: [2, 4, 5, 6]
