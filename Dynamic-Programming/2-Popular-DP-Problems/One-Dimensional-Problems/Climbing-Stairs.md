# Popular Dynamic Programming Problems (Swift)

## 1. Climbing Stairs
**Problem:** You are climbing a staircase. It takes n steps to reach the top.
Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

### Solution
```swift
func climbStairs(_ n: Int) -> Int {
        var steps: [Int] = [1, 1]
        if n == 1 { return 1 }
        for i in 2...n {
            steps.append(steps[i - 1] + steps[i - 2])
        }

        return steps[n]
    }
```

#### Climbing Stairs Problem Explained Simply:

##### Understanding the Problem:
Imagine you're standing at the bottom of a staircase with n steps. You can climb either:
    - 1 step at a time, or
    - 2 steps at a time

**Question:** How many distinct ways can you climb to the top?

##### Real-Life Example:
For `n = 3` steps, there are 3 ways:
1. 1 + 1 + 1 (three single steps)
2. 1 + 2 (single then double)
3. 2 + 1 (double then single)

##### Why This Solution Works (Simple Logic)

1. **Base Cases:**
    - `steps[0] = 1`: 1 way to stay at ground level (do nothing)
    - `steps[1] = 1`: Only 1 way to climb 1 step

2. **Pattern Recognition:**
    - To reach step 2:
        - Come from step 0 (by taking 2 steps), or
        - Come from step 1 (by taking 1 step)
        - Total: `steps[0] + steps[1] = 1 + 1 = 2` ways

3. **General Rule:**
    - For any step i, the number of ways is the sum of ways to reach:
        - The previous step (i-1)
        - The step before that (i-2)


##### Visualization
```
Step 0: 1 way (stay)
Step 1: 1 way (1)
Step 2: 2 ways (1+1 or 2)
Step 3: 3 ways (1+1+1, 1+2, 2+1)
Step 4: 5 ways (1+1+1+1, 1+1+2, 1+2+1, 2+1+1, 2+2)
```


##### Key Points
1. This is actually the Fibonacci sequence in disguise!
2. We use dynamic programming to store previous results
3. Time complexity: O(n) - we calculate each step once
4. Space complexity: O(n) - we store results for all steps
