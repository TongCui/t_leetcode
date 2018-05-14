//
//  ValidPalindrome.swift
//  t_code
//
//  Created by tcui on 14/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
 
     Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
 
     Note: For the purpose of this problem, we define empty string as valid palindrome.
 
     Example 1:
 
     Input: "A man, a plan, a canal: Panama"
     Output: true
     Example 2:
 
     Input: "race a car"
     Output: false
 */

class ValidPalindrome {
    class Solution {
        func isPalindrome(_ s: String) -> Bool {
            let plain = s.components(separatedBy: CharacterSet.alphanumerics.inverted).map { $0.lowercased() }.joined(separator: "")
            
            return plain == String(plain.reversed())
        }
        
    }
}
