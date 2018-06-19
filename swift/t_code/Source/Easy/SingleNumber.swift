//
//  SingleNumber.swift
//  t_code
//
//  Created by tcui on 10/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
 Given a non-empty array of integers, every element appears twice except for one. Find that single one.
 
 Note:
 
 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 
 Example 1:
 
 Input: [2,2,1]
 Output: 1
 Example 2:
 
 Input: [4,1,2,1,2]
 Output: 4
 
 */

class SingleNumber {
    class Solution {
        func singleNumber(_ nums: [Int]) -> Int {
            var set = Set<Int>()
            
            for num in nums {
                if set.contains(num) {
                    set.remove(num)
                } else {
                    set.insert(num)
                }
            }
            
            return set.first!
        }
        
        func singleNumber1(_ nums: [Int]) -> Int {
            var result = 0
            for i in 0..<nums.count {
                result ^= nums[i]
            }
            return result
        }
        
        func singleNumber3(_ nums: [Int]) -> Int {
            return nums.reduce(into: 0) { (result, num) in
                result ^= num
            }
        }
    }
    
}
