#!/usr/bin/env ruby

# Given two strings s1, s2, find the lowest ASCII sum of deleted characters to make two strings equal.

# Example 1:
# Input: s1 = "sea", s2 = "eat"
# Output: 231
# Explanation: Deleting "s" from "sea" adds the ASCII value of "s" (115) to the sum.
# Deleting "t" from "eat" adds 116 to the sum.
# At the end, both strings are equal, and 115 + 116 = 231 is the minimum sum possible to achieve this.
# Example 2:
# Input: s1 = "delete", s2 = "leet"
# Output: 403
# Explanation: Deleting "dee" from "delete" to turn the string into "let",
# adds 100[d]+101[e]+101[e] to the sum.  Deleting "e" from "leet" adds 101[e] to the sum.
# At the end, both strings are equal to "let", and the answer is 100+101+101+101 = 403.
# If instead we turned both strings into "lee" or "eet", we would get answers of 433 or 417, which are higher.
# Note:

# 0 < s1.length, s2.length <= 1000.
# All elements of each string will have an ASCII value in [97, 122].

# @param {String} s1
# @param {String} s2
# @return {Integer}
def minimum_delete_sum(s1, s2)
  dp = Array.new(s1.size + 1) { Array.new(s2.size + 1, 0) }

  max = 0
  (s1.size - 1).downto(0) do |i|
    (s2.size - 1).downto(0) do |j|
      if s1[i] == s2[j]
        dp[i][j] = dp[i + 1][j + 1] + s1[i].ord
        max = [max, dp[i][j]].max
      end
    end
  end

  puts "max is #{max}"

  (s1 + s2).chars.map{|c|puts "#{c} (#{c.ord})";c.ord}.reduce(0,:+) - 2 * max
end

s1 = ARGV[0]
s2 = ARGV[1]

puts "s1, s2 are #{[s1, s2]}"
puts "res is #{minimum_delete_sum(s1, s2)}"