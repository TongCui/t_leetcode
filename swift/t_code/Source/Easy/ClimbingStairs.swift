//
//  ClimbingStairs.swift
//  t_code
//
//  Created by tcui on 9/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
 
     You are climbing a stair case. It takes n steps to reach to the top.
 
     Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
 
     Note: Given n will be a positive integer.
 
     Example 1:
 
     Input: 2
     Output: 2
     Explanation: There are two ways to climb to the top.
     1. 1 step + 1 step
     2. 2 steps
     Example 2:
 
     Input: 3
     Output: 3
     Explanation: There are three ways to climb to the top.
     1. 1 step + 1 step + 1 step
     2. 1 step + 2 steps
     3. 2 steps + 1 step
 
 */

class ClimbingStairs {
    class Solution {
        func climbStairs(_ n: Int) -> Int {
            guard n > 1 else {
                return 1
            }
            
            var first = 1, second = 1
            
            for _ in (2...n) {
                let next = first + second
                first = second
                second = next
            }
            
            return second
        }
    }
}
