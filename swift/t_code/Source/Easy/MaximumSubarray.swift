//
//  MaximumSubarray.swift
//  t_code
//
//  Created by tcui on 9/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
 
     Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
 
     Example:
 
     Input: [-2,1,-3,4,-1,2,1,-5,4],
     Output: 6
     Explanation: [4,-1,2,1] has the largest sum = 6.
     Follow up:
 
     If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
 
 */

class MaximumSubarray {
    
    class Solution {
        func maxSubArray(_ nums: [Int]) -> Int {
            guard !nums.isEmpty else {
                return 0
            }
            
            var sum = nums.first!
            var res = sum
            var minSum = sum
            
            for num in nums[1...] {
                sum += num
                
                let temp = max(sum - minSum, sum)
                
                if temp > res {
                    res = temp
                }
                
                if sum < minSum {
                    minSum = sum
                }
            }
            
            return res
        }
        
        func maxSubArray1(_ nums: [Int]) -> Int {
            var dp = [Int](repeating: 0, count: nums.count)
            dp[0] = nums[0]
            for i in 1..<dp.count {
                dp[i] = nums[i] + (dp[i - 1] > 0 ? dp[i - 1] : 0)
            }
            return dp.max()!
        }
    }
}
