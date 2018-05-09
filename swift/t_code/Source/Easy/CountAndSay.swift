//
//  CountAndSay.swift
//  t_code
//
//  Created by tcui on 9/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
 
     The count-and-say sequence is the sequence of integers with the first five terms as following:
 
     1.     1
     2.     11
     3.     21
     4.     1211
     5.     111221
     1 is read off as "one 1" or 11.
     11 is read off as "two 1s" or 21.
     21 is read off as "one 2, then one 1" or 1211.
     Given an integer n, generate the nth term of the count-and-say sequence.
 
     Note: Each term of the sequence of integers will be represented as a string.
 
     Example 1:
 
     Input: 1
     Output: "1"
     Example 2:
 
     Input: 4
     Output: "1211"
 
 */

class CountAndSay {
    
    class Solution {
        func countAndSay(_ n: Int) -> String {
            var res = "1"
            for _ in (1..<n) {
                var temp = ""
                var last = res[res.startIndex]
                var count = 1
                
                for c in res[res.index(after: res.startIndex)...] {
                    if c == last {
                        count += 1
                    } else {
                        temp.append("\(count)\(last)")
                        last = c
                        count = 1
                    }
                }
                
                temp.append("\(count)\(last)")
                
                res = temp
            }
            return res
        }
    }
}
