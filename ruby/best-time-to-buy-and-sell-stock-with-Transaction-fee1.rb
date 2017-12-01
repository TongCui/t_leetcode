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
  dp = Array.new(size + 1) { 0 }
  dp[2] = [prices[1] - prices[0] - fee, 0].max 
  2.upto(size - 1) do |idx|
    cur_res = dp[idx]
    0.upto(idx - 1) do |buy|
      next if prices[idx] < prices[buy] + fee
      temp = dp[buy] + prices[idx] - prices[buy] - fee
      cur_res = temp if temp > cur_res
    end
    dp[idx + 1] = cur_res
    # puts "idx #{idx} res #{dp}"
  end

  dp[size]
end


prices = ARGV[0][1...-1].split(",").map{|x| x.to_i }
target = ARGV[1].to_i

puts "prices are #{prices}, with target #{target}"
puts "puts res is #{max_profit(prices, target)}"