// MARK: - 8. Shell Sort

/// Shell Sort
/// Time Complexity: O(n^(3/2)) average, O(n^2) worst, O(n log n) best (depends on gap sequence)
/// Space Complexity: O(1)
///
/// Description:
/// Shell sort improves insertion sort by comparing elements far apart.
/// Gaps are reduced step-by-step until normal insertion sort is performed.
///

func shellSort(_ array: inout [Int]) {
    var gap = array.count / 2
    while gap > 0 {
        for i in gap..<array.count {
            let temp = array[i]
            var j = i
            while j >= gap && array[j - gap] > temp {
                array[j] = array[j - gap]
                j -= gap
            }
            array[j] = temp
        }
        gap /= 2
    }
}

/// Example:
/*
 Initial array:
 [8, 5, 3, 7, 6, 2, 4, 1]

 --- Gap = 4 ---
 Compare 8 and 6 → swap
 [6, 5, 3, 7, 8, 2, 4, 1]

 Compare 5 and 2 → swap
 [6, 2, 3, 7, 8, 5, 4, 1]

 Compare 3 and 4 → no change
 [6, 2, 3, 7, 8, 5, 4, 1]

 Compare 7 and 1 → swap
 [6, 2, 3, 1, 8, 5, 4, 7]

 --- Gap = 2 ---
 Compare 6 and 3 → swap
 [3, 2, 6, 1, 8, 5, 4, 7]

 Compare 2 and 1 → swap
 [3, 1, 6, 2, 8, 5, 4, 7]

 Compare 6 and 4 → swap
 [3, 1, 4, 2, 8, 5, 6, 7]

 Compare 2 and 7 → no change
 [3, 1, 4, 2, 8, 5, 6, 7]

 --- Gap = 1 ---
 Compare 3 and 1 → swap
 [1, 3, 4, 2, 8, 5, 6, 7]

 Compare 4 and 2 → swap
 [1, 3, 2, 4, 8, 5, 6, 7]
 Compare 3 and 2 → swap
 [1, 2, 3, 4, 8, 5, 6, 7]

 Compare 8 and 5 → swap
 [1, 2, 3, 4, 5, 8, 6, 7]

 Compare 8 and 6 → swap
 [1, 2, 3, 4, 5, 6, 8, 7]

 Compare 8 and 7 → swap
 [1, 2, 3, 4, 5, 6, 7, 8]

 Sorted array:
 [1, 2, 3, 4, 5, 6, 7, 8]
 */
