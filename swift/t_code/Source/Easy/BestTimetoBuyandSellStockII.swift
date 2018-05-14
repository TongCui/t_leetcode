//
//  BestTimetoBuyandSellStockII.swift
//  t_code
//
//  Created by tcui on 11/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
 
 Say you have an array for which the ith element is the price of a given stock on day i.
 
 Design an algorithm to find the maximum profit. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times).
 
 Note: You may not engage in multiple transactions at the same time (i.e., you must sell the stock before you buy again).
 
 Example 1:
 
 Input: [7,1,5,3,6,4]
 Output: 7
 Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
 Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
 Example 2:
 
 Input: [1,2,3,4,5]
 Output: 4
 Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
 Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are
 engaging multiple transactions at the same time. You must sell before buying again.
 Example 3:
 
 Input: [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transaction is done, i.e. max profit = 0.
 
 */

class BestTimetoBuyandSellStockII {
    
    class Solution {
        func maxProfit(_ prices: [Int]) -> Int {
            guard prices.count > 1 else {
                return 0
            }
            
            var lastProfit = 0
            var profit = 0
            var buy = prices.first!
            
            for idx in 1..<prices.count {
                let cur = prices[idx]
                let last = prices[idx - 1]
                if cur < last {
                    lastProfit += profit
                    profit = 0
                    buy = prices[idx]
                } else {
                    profit = cur - buy
                }
            }
            
            return lastProfit + profit
        }

        func maxProfit1(_ prices: [Int]) -> Int {
            guard prices.count > 1 else {
                return 0
            }
            return (1..<prices.count).reduce(into: 0) { (result, idx) in
                result += max(0, prices[idx] - prices[idx - 1])
            }
        }
        
        func maxProfit2(_ prices: [Int]) -> Int {
            guard prices.count > 1 else {
                return 0
            }
            var res = 0
            for idx in (1..<prices.count) {
                res += max(0, prices[idx] - prices[idx - 1])
            }
            return res
        }

    }
}
