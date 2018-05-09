//
//  SqrtX.swift
//  t_code
//
//  Created by tcui on 9/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
     Implement int sqrt(int x).
 
     Compute and return the square root of x, where x is guaranteed to be a non-negative integer.
 
     Since the return type is an integer, the decimal digits are truncated and only the integer part of the result is returned.
 
     Example 1:
 
     Input: 4
     Output: 2
     Example 2:
 
     Input: 8
     Output: 2
     Explanation: The square root of 8 is 2.82842..., and since
     the decimal part is truncated, 2 is returned.
 
 */

class SqrtX {
    
    class Solution {
        func mySqrt(_ x: Int) -> Int {
            guard x > 0 else {
                return 0
            }
            
            guard x > 1 else {
                return 1
            }
            
            var res = 1
            
            for i in (1...(x/2)) {
                if i * i > x {
                    break
                } else {
                    res = i
                }
            }
            
            return res
        }
        
        func mySqrt1(_ x: Int) -> Int {
            var left = 0
            var right = x
            var res = 0
            
            while left <= right {
                let mid = left + (right - left) / 2
                let square = mid * mid
                if square == x {
                    return mid
                } else if square > x {
                    right = mid - 1
                } else {
                    left = mid + 1
                    res = mid
                }
            }
            
            return res
        }
    }
}
