//
//  AddBinary.swift
//  t_code
//
//  Created by tcui on 9/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
 
     Given two binary strings, return their sum (also a binary string).
 
     The input strings are both non-empty and contains only characters 1 or 0.
 
     Example 1:
 
     Input: a = "11", b = "1"
     Output: "100"
     Example 2:
 
     Input: a = "1010", b = "1011"
     Output: "10101"
 
 */

class AddBinary {
    class Solution {
        func addBinary(_ a: String, _ b: String) -> String {
            
            var aChars = (a.count > b.count ? a : b).reversed().map { Int(String($0))! }
            let bChars = (a.count > b.count ? b : a).reversed().map { Int(String($0))! }
            let bCount = bChars.count
            var carry = 0
            
            for (idx, aDigit) in aChars.enumerated() {
                let bDigit = idx < bCount ? bChars[idx] : 0
                let new = carry + aDigit + bDigit
                carry = new / 2
                aChars[idx] = new % 2
            }
        
            if carry == 1 {
                aChars.append(1)
            }
            
            return aChars.reversed().map { String($0) }.joined()
        }
        
        func addBinary1(_ a: String, _ b: String) -> String {
            let aChars = Array(a)
            let bChars = Array(b)
            var binary = ""
            var aIdx = aChars.count - 1
            var bIdx = bChars.count - 1
            var carry = false
            
            while aIdx >= 0 || bIdx >= 0 || carry {
                var sum = carry ? 1 : 0
                if aIdx >= 0 {
                    sum += aChars[aIdx] == "1" ? 1 : 0
                    aIdx -= 1
                }
                if bIdx >= 0 {
                    sum += bChars[bIdx] == "1" ? 1 : 0
                    bIdx -= 1
                }
                
                carry = sum >= 2
                binary = "\(sum % 2)\(binary)"
            }
            
            return binary
        }
    }

}
