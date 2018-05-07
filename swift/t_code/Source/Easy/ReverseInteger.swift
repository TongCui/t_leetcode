//
//  ReverseInteger.swift
//  t_code
//
//  Created by tcui on 7/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation


/*
 
     Given a 32-bit signed integer, reverse digits of an integer.
 
     Example 1:
 
     Input: 123
     Output: 321
     Example 2:
 
     Input: -123
     Output: -321
     Example 3:
 
     Input: 120
     Output: 21
     Note:
     Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
 
 */


class ReverseInteger {
    class Solution {
        func reverse(_ x: Int) -> Int {
            let isNegative = x < 0
            
            var num = isNegative ? -x : x
            
            var res = 0
            
            while num >= 10 {
                let reminder = num % 10
                num = num / 10
                res = res * 10 + reminder
            }
            
            res = res * 10 + num
            
            
            let max = 1 << 31 - 1
            let min = -(1 << 31)
            guard res >= min && res <= max else {
                return 0
            }
            
            return isNegative ? -res : res
        }
        
        //  Demo
        func reverse1(_ x: Int) -> Int {
            var xCopy = x
            var result = 0
            
            while xCopy != 0  {
                let r = xCopy % 10
                xCopy = xCopy / 10
                result = result * 10 + r
            }
            
            
            if result > 2147483647 || result < -2147483647 {
                return 0
            } else {
                return result
            }
        }
    }
}
