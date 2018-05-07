//
//  RomanToInteger.swift
//  t_code
//
//  Created by tcui on 7/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
 
     Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
 
     Symbol       Value
     I             1
     V             5
     X             10
     L             50
     C             100
     D             500
     M             1000
     For example, two is written as II in Roman numeral, just two one's added together. Twelve is written as, XII, which is simply X + II. The number twenty seven is written as XXVII, which is XX + V + II.
 
     Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:
 
     I can be placed before V (5) and X (10) to make 4 and 9.
     X can be placed before L (50) and C (100) to make 40 and 90.
     C can be placed before D (500) and M (1000) to make 400 and 900.
     Given a roman numeral, convert it to an integer. Input is guaranteed to be within the range from 1 to 3999.
 
     Example 1:
 
     Input: "III"
     Output: 3
     Example 2:
 
     Input: "IV"
     Output: 4
     Example 3:
 
     Input: "IX"
     Output: 9
     Example 4:
 
     Input: "LVIII"
     Output: 58
     Explanation: C = 100, L = 50, XXX = 30 and III = 3.
     Example 5:
 
     Input: "MCMXCIV"
     Output: 1994
     Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
 
 */

class RomanToInteger {
    class Solution {
        
        func getTwoCharWord(s: String, from: String.Index) -> String {
            let end = s.index(from, offsetBy: 1)
            return String(s[from...end])
        }
        
        func romanToInt(_ s: String) -> Int {
            
            print(s)
            
            let count = s.count
            var res = 0
            var offset = 0
            
            while offset < count {
                let index = s.index(s.startIndex, offsetBy: offset)
                switch s[index] {
                case "I":
                    if offset < count - 1  {
                        switch getTwoCharWord(s: s, from: index) {
                        case "IV":
                            res += 4
                            offset += 1
                        case "IX":
                            res += 9
                            offset += 1
                        default:
                            res += 1
                        }
                    } else {
                        res += 1
                    }
                case "V":
                    res += 5
                case "X":
                    if offset < count - 1  {
                        switch getTwoCharWord(s: s, from: index) {
                        case "XL":
                            res += 40
                            offset += 1
                        case "XC":
                            res += 90
                            offset += 1
                        default:
                            res += 10
                        }
                    } else {
                        res += 10
                    }
                case "L":
                    res += 50
                case "C":
                    if offset < count - 1  {
                        switch getTwoCharWord(s: s, from: index) {
                        case "CD":
                            res += 400
                            offset += 1
                        case "CM":
                            res += 900
                            offset += 1
                        default:
                            res += 100
                        }
                    } else {
                        res += 100
                    }
                case "D":
                    res += 500
                case "M":
                    res += 1000
                default:
                    fatalError()
                }
                
                offset += 1
            }
            
            
            return res
        }
    }
}
