//
//  LengthOfLastWord.swift
//  t_code
//
//  Created by tcui on 9/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
 
     Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word in the string.
 
     If the last word does not exist, return 0.
 
     Note: A word is defined as a character sequence consists of non-space characters only.
 
     Example:
 
     Input: "Hello World"
     Output: 5
 
 */

class LengthOfLastWord {
    class Solution {
        func lengthOfLastWord(_ s: String) -> Int {
            var lastWordLength = 0
            var lastWordSpace = true
            for c in s {
                if c == " " {
                    lastWordSpace = true
                } else if lastWordSpace {
                    lastWordLength = 1
                    lastWordSpace = false
                } else {
                    lastWordLength += 1
                }
            }
            
            return lastWordLength
        }
    }
}
