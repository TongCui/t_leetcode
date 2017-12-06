#!/usr/bin/env ruby

# You are given n pairs of numbers. In every pair, the first number is always smaller than the second number.

# Now, we define a pair (c, d) can follow another pair (a, b) if and only if b < c. Chain of pairs can be formed in this fashion.

# Given a set of pairs, find the length longest chain which can be formed. You needn't use up all the given pairs. You can select pairs in any order.

# Example 1:
# Input: [[1,2], [2,3], [3,4]]
# Output: 2
# Explanation: The longest chain is [1,2] -> [3,4]
# Note:
# The number of given pairs will be in the range [1, 1000].

# @param {Integer[][]} pairs
# @return {Integer}
def find_longest_chain(pairs)
  return 0 if pairs.nil? or pairs.empty?
  pairs.sort! { |a, b| a[1] <=> b[1] }
  # puts "sorted pairs #{pairs}"
  dp = Array.new(pairs.size, 1)
  1.upto(pairs.size - 1) do |i|
    len = 1
    0.upto(i - 1) do |j|
      len = [len, dp[j] + 1].max if pairs[j][1] < pairs[i][0]
    end
    dp[i] = len
  end
  dp.max
end

pairs = ARGV[0][2...-2].split("],[").map{|x|x.split(",").map{|x|x.to_i}}
puts "pairs #{pairs}"
puts "res is #{find_longest_chain(pairs)}"