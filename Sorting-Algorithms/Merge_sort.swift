// MARK: - 5. Merge Sort

/// Merge Sort
/// Time Complexity: O(n log n) in all cases
/// Space Complexity: O(n)
///
/// Description:
/// Merge sort divides the array into halves, recursively sorts each half,
/// and then merges the sorted halves.
///

func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    let middle = array.count / 2
    let left = mergeSort(Array(array[0..<middle]))
    let right = mergeSort(Array(array[middle..<array.count]))
    return merge(left, right)
}

private func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var result = [Int]()
    var l = 0, r = 0
    while l < left.count && r < right.count {
        if left[l] < right[r] {
            result.append(left[l])
            l += 1
        } else {
            result.append(right[r])
            r += 1
        }
    }
    result += left[l...]
    result += right[r...]
    return result
}

/// Example: Sorting [38, 27, 43, 3, 9, 82, 10]
/// Split -> [38, 27, 43], [3, 9, 82, 10]
/// Merge step-by-step sorted parts
