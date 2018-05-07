//
//  TwoSum.swift
//  t_code
//
//  Created by tcui on 7/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation


/*
 
    Given an array of integers, return indices of the two numbers such that they add up to a specific target.

    You may assume that each input would have exactly one solution, and you may not use the same element twice.

    Example:

    Given nums = [2, 7, 11, 15], target = 9,

    Because nums[0] + nums[1] = 2 + 7 = 9,
    return [0, 1].
*/

class TwoSum {
    
    class Solution {
        func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
            let count = nums.count
            
            for i in (0..<count) {
                
                let next_target = target - nums[i]
                
                for j in ((i + 1)..<count) {
                    
                    if nums[j] == next_target {
                        return [i, j]
                    }
                }
                
            }
            
            return []
        }
    }
    
}
