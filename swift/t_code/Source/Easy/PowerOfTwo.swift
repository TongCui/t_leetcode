//
//  PowerOfTwo.swift
//  t_code
//
//  Created by Tong on 09/07/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

class PowerOfTwo {
    class Solution {
        func isPowerOfTwo(_ n: Int) -> Bool {
            guard n > 0 else {
                return false
            }
            
            var num = n
            
            while num > 0 {
                if (num & 1) == 1 {
                    return num >> 1 == 0
                } else {
                    num = num >> 1
                }
            }
            
            return false
        }
        
        //  From leetcode
        func isPowerOfTwo1(_ n: Int) -> Bool {
            if n != 0 && n & (n - 1) == 0 {
                return true
            }
            return false
        }
    }
}
