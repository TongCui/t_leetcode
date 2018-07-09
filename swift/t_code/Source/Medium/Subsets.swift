//
//  Subsets.swift
//  t_code
//
//  Created by Tong on 08/07/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
 Given a set of distinct integers, nums, return all possible subsets (the power set).
 
 Note: The solution set must not contain duplicate subsets.
 
 Example:
 
 Input: nums = [1,2,3]
 Output:
 [
 [3],
 [1],
 [2],
 [1,2,3],
 [1,3],
 [2,3],
 [1,2],
 []
 ]

 */

class Subsets {
    class Solution {
        func subsets(_ nums: [Int]) -> [[Int]] {
            
            guard !nums.isEmpty else {
                return [[]]
            }
            
            let count = nums.count
            let total = 1 << count
            
            let res = (0..<total).map { flags in
                nums.enumerated().compactMap{ (arg) -> Int? in
                    let (idx, num) = arg
                    let flag = ((flags >> idx) & 1 == 1)
                    return flag ? num : nil
                }
            }
            
            return res
        }
    }
}
