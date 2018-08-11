//
//  Triangle.swift
//  t_code
//
//  Created by Tong on 11/08/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation


/*
 
 Given a triangle, find the minimum path sum from top to bottom. Each step you may move to adjacent numbers on the row below.
 
 For example, given the following triangle
 
 [
 [2],
 [3,4],
 [6,5,7],
 [4,1,8,3]
 ]
 The minimum path sum from top to bottom is 11 (i.e., 2 + 3 + 5 + 1 = 11).
 
 Note:
 
 Bonus point if you are able to do this using only O(n) extra space, where n is the total number of rows in the triangle.
 
 
 */

class Triangle {
    class Solution {
        func minimumTotal(_ triangle: [[Int]]) -> Int {
            var dp = [0]

            for (i, array) in triangle.enumerated() {
                let range = (0...i)
                dp = range.map { (j) -> Int in
                    if j == 0 {
                        return dp[0] + array[j]
                    } else if i == j {
                        return dp[j - 1] + array[j]
                    } else {
                        return min(dp[j - 1] + array[j], dp[j] + array[j])
                    }
                }
            }
            return dp.min() ?? 0
        }
    }
}
