//
//  PascalsTriangle.swift
//  t_code
//
//  Created by tcui on 11/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation




/*
 Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.
 Input: 5
 Output:
 [
 [1],
 [1,1],
 [1,2,1],
 [1,3,3,1],
 [1,4,6,4,1]
 ]
 
 */

class PascalsTriangle {
    class Solution {
        func generate(_ numRows: Int) -> [[Int]] {
            guard numRows > 1 else {
                return numRows == 1 ? [[1]] : []
            }
            
            var nums = generate(numRows - 1)
            let lastRow = nums.last!
            
            let row = zip([0] + lastRow, lastRow + [0]).reduce(into: [Int]()) { (res, arg1) in
                res.append(arg1.0 + arg1.1)
            }
            
            nums.append(row)
            
            return nums
        }
    }

}
