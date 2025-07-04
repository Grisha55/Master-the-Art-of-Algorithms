# Popular Dynamic Programming Problems (Swift)

## House Robber

**Problem:** You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.


### Solution:
```swift
func rob(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 } // if nums is empty -> return 0
        if nums.count == 1 { return nums[0] } // If there is only one house -> return its value

        var prev1 = max(nums[0], nums[1]) // the maximum amount that can be robbed at the moment, if we have already looked at the second house.
        var prev2 = nums[0] // maximum amount after the first house.

        // We go house by house starting from the third one (i = 2), and each time we choose:
        for i in 2..<nums.count {

            // don't rob the current house → keep what we already had (prev1)
            // rob the current house → add it to the amount we could have gotten without touching the previous one (prev2 + nums[i])
            let current = max(prev1, prev2 + nums[i])

            // Update prev2 and prev1 to move on
            prev2 = prev1
            prev1 = current
        }

        // At the end, prev1 stores the maximum amount that can be stolen without violating the conditions.
        return prev1
    }
```
