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
  dp_hold = Array.new(prices.size - 1, 0)
  dp_cash = Array.new(prices.size - 1, 0)

  dp_hold[0] = -prices[0] - fee
  dp_cash[0] = 0
  
  # puts "current hold cash #{[dp_hold[0], dp_cash[0]]}"

  (1...(prices.size)).each do |i|
    dp_hold[i] = [dp_cash[i - 1] - prices[i] - fee, dp_hold[i - 1]].max
    dp_cash[i] = [dp_hold[i - 1] + prices[i], dp_cash[i - 1]].max
    # puts "[#{i})]current hold cash #{[dp_hold[i], dp_cash[i]]}"
  end
  # puts "dp hold #{dp_hold}"
  # puts "dp cash #{dp_cash}" 
  dp_cash[prices.size - 1]
end


prices = ARGV[0][1...-1].split(",").map{|x| x.to_i }
target = ARGV[1].to_i

puts "prices are #{prices}, with target #{target}"
puts "puts res is #{max_profit(prices, target)}"