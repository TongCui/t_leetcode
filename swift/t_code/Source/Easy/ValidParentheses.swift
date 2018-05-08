//
//  ValidParentheses.swift
//  t_code
//
//  Created by tcui on 8/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
 
     Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 
     An input string is valid if:
 
     Open brackets must be closed by the same type of brackets.
     Open brackets must be closed in the correct order.
     Note that an empty string is also considered valid.
 
     Example 1:
 
     Input: "()"
     Output: true
     Example 2:
 
     Input: "()[]{}"
     Output: true
     Example 3:
 
     Input: "(]"
     Output: false
     Example 4:
 
     Input: "([)]"
     Output: false
     Example 5:
 
     Input: "{[]}"
     Output: true

 */

class ValidParentheses {
    class Solution {
        func isValid(_ s: String) -> Bool {
            
            var stack = [Character]()
            
            let pairs: [[Character]] = [["(",")"], ["[", "]"], ["{", "}"]]
            
            for char in s {
                switch char {
                case "(", "{", "[":
                    stack.append(char)
                case ")", "}", "]":
                    if let last = stack.popLast(), pairs.contains(where: { $0.first! == last && $0.last! == char }) {
                        
                    } else {
                        return false
                    }
                default: fatalError()
                }
            }
            
            
            return stack.isEmpty
        }
    }
}
