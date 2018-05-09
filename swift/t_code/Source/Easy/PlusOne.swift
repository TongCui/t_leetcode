//
//  PlusOne.swift
//  t_code
//
//  Created by tcui on 9/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
     Given a non-empty array of digits representing a non-negative integer, plus one to the integer.
 
     The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.
 
     You may assume the integer does not contain any leading zero, except the number 0 itself.
 
     Example 1:
 
     Input: [1,2,3]
     Output: [1,2,4]
     Explanation: The array represents the integer 123.
     Example 2:
 
     Input: [4,3,2,1]
     Output: [4,3,2,2]
     Explanation: The array represents the integer 4321.
 
 */

class PlusOne {
    class Solution {
        func plusOne(_ digits: [Int]) -> [Int] {
            var carry = false
            
            var index = digits.count - 1
            var res = digits
            
            while index >= 0 {
                let add = digits[index] + 1
                if add < 10 {
                    res[index] = add
                    return res
                } else {
                    res[index] = 0
                    carry = true
                }
                index -= 1
            }
            
            if carry {
                res.insert(1, at: 0)
            }
            
            return res
        }
    }
}
