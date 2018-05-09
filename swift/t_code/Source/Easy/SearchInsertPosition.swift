//
//  SearchInsertPosition.swift
//  t_code
//
//  Created by tcui on 9/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
 
     Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
 
     You may assume no duplicates in the array.
 
     Example 1:
 
     Input: [1,3,5,6], 5
     Output: 2
     Example 2:
 
     Input: [1,3,5,6], 2
     Output: 1
     Example 3:
 
     Input: [1,3,5,6], 7
     Output: 4
     Example 4:
 
     Input: [1,3,5,6], 0
     Output: 0
 
 */

class SearchInsertPosition {
    class Solution {
        func searchInsert(_ nums: [Int], _ target: Int) -> Int {
            guard !nums.isEmpty else {
                return 0
            }
            
            var from = 0
            var to = nums.count - 1
            var mid = 0
            
            while from <= to {
                mid = from + (to - from) / 2
                let cur = nums[mid]
                
                if cur == target {
                    return mid
                } else if cur > target {
                    to = mid - 1
                } else {
                    from = mid + 1
                }
            }
            
            return target < nums[mid] ? mid : mid + 1
        }
    }
}
