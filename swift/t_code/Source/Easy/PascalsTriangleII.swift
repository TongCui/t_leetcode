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

class PascalsTriangleII {
    class Solution {
        func getRow(_ rowIndex: Int) -> [Int] {
            guard rowIndex > 0 else {
                return [1]
            }
            
            var res = [1]
            for _ in (1...rowIndex) {
                res = zip(res + [0], [0] + res).map { $0.0 + $0.1 }
            }
            
            return res
        }
        
        func getRow1(_ rowIndex: Int) -> [Int] {
            guard rowIndex > 1 else {
                return rowIndex == 0 ? [1] : [1, 1]
            }
            
            var res = [1, 1]
            
            for _ in (2...rowIndex) {
                var idx: Int = res.count - 1
                while idx > 0 {
                    res[idx] = res[idx] + res[idx - 1]
                    idx -= 1
                }
            
                res.append(1)
            }
            
            return res
        }
    }

}
