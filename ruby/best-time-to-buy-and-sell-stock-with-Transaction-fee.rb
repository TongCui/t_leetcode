#!/usr/bin/env ruby

# Your are given an array of integers prices, for which the i-th element is the price of a given stock on day i; and a non-negative integer fee representing a transaction fee.

# You may complete as many transactions as you like, but you need to pay the transaction fee for each transaction. You may not buy more than 1 share of a stock at a time (ie. you must sell the stock share before you buy again.)

# Return the maximum profit you can make.

# Example 1:
# Input: prices = [1, 3, 2, 8, 4, 9], fee = 2
# Output: 8
# Explanation: The maximum profit can be achieved by:
# Buying at prices[0] = 1
# Selling at prices[3] = 8
# Buying at prices[4] = 4
# Selling at prices[5] = 9
# The total profit is ((8 - 1) - 2) + ((9 - 4) - 2) = 8.
# Note:

# 0 < prices.length <= 50000.
# 0 < prices[i] < 50000.
# 0 <= fee < 50000.

# @param {Integer[]} prices
# @param {Integer} fee
# @return {Integer}
def max_profit(prices, fee)
  return 0 if prices.nil? or prices.size < 2
  size = prices.size
  dp = Array.new(size) { Array.new(size, nil) }
  dp_max_profix(prices, fee, 0, size - 1, dp)
  dp[0][size - 1]
end

def dp_max_profix(prices, fee, from, to, dp)
  puts "Go #{[from, to]}"
  return 0 if from >= to
  return dp[from][to] if dp[from][to]

  if to == from + 1
    dp[from][to] = [prices[to] - prices[from] - fee, 0].max
  elsif to > from + 1
    
    cur_res = 0
    from.upto(to - 1) do |buy|  
      (buy + 1).upto(to) do |sell|
        temp = dp_max_profix(prices, fee, from, buy - 1, dp) + (prices[sell] - prices[buy] - fee) + dp_max_profix(prices, fee, sell + 1, to, dp)
        cur_res = temp if temp > cur_res
      end
    end

    dp[from][to] = cur_res
    
  else
    dp[from][to] = 0
  end

  dp[from][to]
end

prices = ARGV[0][1...-1].split(",").map{|x| x.to_i }
target = ARGV[1].to_i

puts "prices are #{prices}, with target #{target}"
puts "puts res is #{max_profit(prices, target)}"