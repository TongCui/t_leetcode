//
//  RestoreIPAddresses.swift
//  t_code
//
//  Created by Tong on 28/07/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

class RestoreIPAddresses {
    class Solution {
        func restoreIpAddresses(_ s: String) -> [String] {
            let count = s.count
            guard count >= 4 && count <= 12 else {
                return []
            }
            
            func isValidNumber(_ number:String) -> Bool {
                if let value = Int(number) {
                    return value >= 0 && value < 256 && number == "\(value)"
                } else {
                    return false
                }
            }
            
            var res = [String]()
            for i in (1..<4) {
                for j in ((i + 1)..<(i + 4)) {
                    for z in ((j + 1)..<(j + 4)) {
                        if i < count - 2 && j < count - 1 && z < count && count - 1 - z < 3 {
                            let iIndex = s.index(s.startIndex, offsetBy: i)
                            let jIndex = s.index(s.startIndex, offsetBy: j)
                            let zIndex = s.index(s.startIndex, offsetBy: z)
                            let number1 = String(s[s.startIndex..<iIndex])
                            let number2 = String(s[iIndex..<jIndex])
                            let number3 = String(s[jIndex..<zIndex])
                            let number4 = String(s[zIndex..<s.endIndex])
                            
                            
                            if isValidNumber(number1) && isValidNumber(number2) && isValidNumber(number3) && isValidNumber(number4) {
                                
                                print(number1,number2,number3,number4)
                                res.append(["\(number1)", "\(number2)", "\(number3)", "\(number4)"].joined(separator: "."))
                            }
                        }
                    }
                }
            }
            
            
            return res
        }
    }
    
    
}
