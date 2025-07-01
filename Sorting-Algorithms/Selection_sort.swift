// MARK: - 2. Selection Sort

/// Selection Sort
/// Time Complexity: O(n^2) in all cases
/// Space Complexity: O(1)
///
/// Description:
/// Selection sort repeatedly finds the minimum element from the unsorted part
/// and moves it to the end of the sorted part.
func selectionSort(_ array: inout [Int]) {
    for i in 0..<array.count {
        var minIndex = i
        for j in i+1..<array.count {
            if array[j] < array[minIndex] {
                minIndex = j
            }
        }
        array.swapAt(i, minIndex)
    }
}

/// Example: Sorting [29, 10, 14, 37, 13]
/// Step 1: [10, 29, 14, 37, 13]
/// Step 2: [10, 13, 14, 37, 29]
/// Step 3: [10, 13, 14, 37, 29]
/// Step 4: [10, 13, 14, 29, 37]
