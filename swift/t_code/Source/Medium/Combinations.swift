//
//  Combinations.swift
//  t_code
//
//  Created by Tong on 09/07/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation


/*
 
 Given two integers n and k, return all possible combinations of k numbers out of 1 ... n.
 
 Example:
 
 Input: n = 4, k = 2
 Output:
 [
 [2,4],
 [3,4],
 [2,3],
 [1,2],
 [1,3],
 [1,4],
 ]
 
 */

class Combinations {
    
    class Solution {
        
        func combine(_ n: Int, _ k: Int) -> [[Int]] {
            guard k > 0 else {
                return [[]]
            }
            
            guard n >= 1 && n >= k else {
                return []
            }
            
            var dp = [[[[Int]]]](repeating: [[[Int]]](repeating: [], count: k + 1), count: n + 1)
            print(dp)
            
            (1...n).forEach { (i) in
                let target = min(i, k)
                (1...target).forEach{ (j) in
                    let last = dp[i - 1][j - 1]
                    
                    if last.isEmpty {
                        dp[i][j] = dp[i - 1][j] + [[i]]
                    } else {
                        dp[i][j] = dp[i - 1][j] + dp[i - 1][j - 1].map { array in
                            array + [i]
                        }
                    }
                }
            }
            
            return dp[n][k]
        }
        
        func combine2(_ n: Int, _ k: Int) -> [[Int]] {
            var nums = [Int]()
            var result = [[Int]]()
            recurse(n: n, k: k, current: nums, result: &result)
            return result
        }
        
        func recurse(n: Int, k: Int, current: [Int], result: inout [[Int]]) {
            if k == 0 {
                result.append(current)
                return
            }
            
            if n == 0 || n < k {
                return
            }
            
            if n == k {
                var current = current
                for i in 1...n {
                    current.append(i)
                }
                result.append(current)
                return
            }
            
            recurse(n: n - 1, k: k, current: current, result: &result)
            recurse(n: n - 1, k: k - 1, current: current + [n], result: &result)
        }
        
        func combine1(_ n: Int, _ k: Int) -> [[Int]] {
            
            guard k > 0 else {
                return [[]]
            }
            
            guard n >= 1 && n >= k else {
                return []
            }
            
            let total = 1 << n
            let range = 1...n
            
            let res = (0..<total).compactMap { flags -> [Int]? in
                if oneCounts(flags, n: n) == k {
                    return range.enumerated().compactMap { (arg) -> Int? in
                        let (idx, num) = arg
                        let flag = ((flags >> idx) & 1 == 1)
                        return flag ? num : nil
                    }
                } else {
                    return nil
                }
            }
            
            return res
        }
        
        func oneCounts(_ flags: Int, n: Int) -> Int {
            return (0..<n).reduce(into: 0) { (res, i) in
                if flags >> i & 1 == 1 {
                    res += 1
                }
            }
        }
    }
}
