// MARK: - 9. Radix Sort

/// Radix Sort (for non-negative integers)
/// Time Complexity: O(nk), where k is the number of digits
/// Space Complexity: O(n + k)
///
/// Description:
/// Radix sort processes each digit of the number starting from least significant (LSD).
/// It uses stable counting sort per digit.
///

func radixSort(_ array: inout [Int]) {
    guard let maxVal = array.max() else { return }
    var exp = 1
    while maxVal / exp > 0 {
        countingSortByDigit(&array, exp)
        exp *= 10
    }
}

private func countingSortByDigit(_ array: inout [Int], _ exp: Int) {
    var output = Array(repeating: 0, count: array.count)
    var count = Array(repeating: 0, count: 10)

    for number in array {
        let digit = (number / exp) % 10
        count[digit] += 1
    }

    for i in 1..<10 {
        count[i] += count[i - 1]
    }

    for i in stride(from: array.count - 1, through: 0, by: -1) {
        let digit = (array[i] / exp) % 10
        output[count[digit] - 1] = array[i]
        count[digit] -= 1
    }

    for i in 0..<array.count {
        array[i] = output[i]
    }
}

/// Example: Sorting [170, 45, 75, 90, 802, 24, 2, 66]
/// Pass 1 (unit place): [170, 90, 802, 2, 24, 45, 75, 66]
/// Pass 2 (tens): [802, 2, 24, 45, 66, 170, 75, 90]
/// Pass 3 (hundreds): [2, 24, 45, 66, 75, 90, 170, 802]
