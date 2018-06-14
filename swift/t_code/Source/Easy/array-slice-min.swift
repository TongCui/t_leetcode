//
//  array-slice-min.swift
//  t_code
//
//  Created by tcui on 14/6/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation
class ArraySliceMinValue {
    class Solution {
        func minStartIndex(_ array: [Int]) -> Int {
            guard array.count > 1 else {
                return 0
            }
            
            var dp = [Double](repeating: 0, count: array.count)
            
            
            var idx = 2
            var start = 0, end = 1
            var minSum = array[0] + array[1]
            dp[1] = Double(minSum) / 2
            var min = dp[1]
            while idx < array.count {
                let tempSum = array[idx] + array[idx - 1]
                
                if end == idx - 1 {
                    
                    
                    
                } else {
                    if Double(tempSum) / 2 < min {
                        min = Double(tempSum) / 2
                        start = idx - 1
                        end = idx
                        minSum = tempSum
                    }
                }
                
                
                idx += 1
            }
                
                    
                
            
            
            
            
            return 0
        }
        
        
    }
}
