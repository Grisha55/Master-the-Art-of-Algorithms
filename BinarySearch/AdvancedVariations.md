# Advanced Variations

1. Rotated sorted arrays:
```swift
func searchInRotatedArray(_ nums: [Int], _ target: Int) -> Int {
    var low = 0, high = nums.count - 1
    while low <= high {
        let mid = (low + high) / 2
        if nums[mid] == target { return mid }
        
        if nums[low] <= nums[mid] {  // Left half is sorted
            if nums[low] <= target && target < nums[mid] {
                high = mid - 1
            } else {
                low = mid + 1
            }
        } else {  // Right half is sorted
            if nums[mid] < target && target <= nums[high] {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
    }
    return -1
}
```

2. Finding peaks:
```swift
func findPeakElement(_ nums: [Int]) -> Int {
    var low = 0, high = nums.count - 1
    while low < high {
        let mid = (low + high) / 2
        if nums[mid] > nums[mid + 1] {
            high = mid
        } else {
            low = mid + 1
        }
    }
    return low
}
```
