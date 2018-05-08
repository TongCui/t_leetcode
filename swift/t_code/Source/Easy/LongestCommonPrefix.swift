//
//  LongestCommonPrefix.swift
//  t_code
//
//  Created by tcui on 8/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
 
     Write a function to find the longest common prefix string amongst an array of strings.
 
     If there is no common prefix, return an empty string "".
 
     Example 1:
 
     Input: ["flower","flow","flight"]
     Output: "fl"
     Example 2:
 
     Input: ["dog","racecar","car"]
     Output: ""
     Explanation: There is no common prefix among the input strings.
     Note:
 
     All given inputs are in lowercase letters a-z.
 
 */

class LongestCommonPrefix {
    class Solution {
        func longestCommonPrefix(_ strs: [String]) -> String {
            guard !strs.isEmpty else {
                return ""
            }
            
            let sorted = strs.sorted { $0.count < $1.count }
            
            let first = sorted.first!
            var endIndex: String.Index?
            
            check: for index in first.indices {
                let char = first[index]
                for str in sorted[1...] {
                    let curChar = str[index]
                    if curChar != char {
                        break check
                    }
                }
                
                endIndex = index
            }
            
            if let index = endIndex {
                return String(first[...index])
            } else {
                return ""
            }
            
        }
        
        
        func longestCommonPrefix1(_ strs: [String]) -> String {
            
            var longest = ""
            
            // update longest prefix to the first entry
            if !strs.isEmpty {
                longest = strs[0]
            }
            
            // loop through each word
            for word in strs {
                // if the word doesn't have the prefix longest, update longest as appropriate
                if !word.hasPrefix(longest) {
                    // while the word doesn't have the prefix longest, cut off the last character until it does
                    while !word.hasPrefix(longest) {
                        longest.removeLast()
                    }
                }
            }
            
            return longest
        }
        
        func longestCommonPrefix2(_ strs: [String]) -> String {
            
            guard !strs.isEmpty else {
                return ""
            }
            
            var longest = strs.first!
            
            for word in strs {
                while !word.hasPrefix(longest) {
                    longest.removeLast()
                }
            }
            
            return longest
        }
    }
}
