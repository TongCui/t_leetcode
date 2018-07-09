//
//  ContainsDuplicate.swift
//  t_code
//
//  Created by Tong on 09/07/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
 Given an array of integers, find if the array contains any duplicates.
 
 Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.
 
 Example 1:
 
 Input: [1,2,3,1]
 Output: true
 Example 2:
 
 Input: [1,2,3,4]
 Output: false
 Example 3:
 
 Input: [1,1,1,3,3,4,3,2,4,2]
 Output: true

 
 */

class ContainsDuplicate {
    class Solution {
        func containsDuplicate(_ nums: [Int]) -> Bool {
            var set = Set<Int>()
            
            for num in nums {
                if set.contains(num) {
                    return true
                } else {
                    set.insert(num)
                }
            }
            
            return false
        }
    }
}
