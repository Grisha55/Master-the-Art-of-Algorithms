// MARK: - 3. Bubble Sort

/// Bubble Sort
/// Time Complexity: O(n^2) average and worst, O(n) best (optimized version)
/// Space Complexity: O(1)
/// 
/// Description:
/// Bubble sort repeatedly swaps adjacent elements if they are in the wrong order.
/// With each pass, the largest unsorted element "bubbles up" to its correct position.

func bubbleSort(_ array: inout [Int]) {
    for i in 0..<array.count {
        var swapped = false
        for j in 0..<array.count - i - 1 {
            if array[j] > array[j + 1] {
                array.swapAt(j, j + 1)
                swapped = true
            }
        }
        if !swapped { break }
    }
}

/// Example: Sorting [5, 1, 4, 2, 8]
/// Step 1: [1, 4, 2, 5, 8]
/// Step 2: [1, 2, 4, 5, 8]
/// Step 3: [1, 2, 4, 5, 8]
