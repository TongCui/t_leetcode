#!/usr/bin/env ruby

# Given a string, your task is to count how many palindromic substrings in this string.

# The substrings with different start indexes or end indexes are counted as different substrings even they consist of same characters.

# Example 1:
# Input: "abc"
# Output: 3
# Explanation: Three palindromic strings: "a", "b", "c".
# Example 2:
# Input: "aaa"
# Output: 6
# Explanation: Six palindromic strings: "a", "a", "a", "aa", "aa", "aaa".
# Note:
# The input string length won't exceed 1000.

# @param {String} s
# @return {Integer}
def count_substrings(s)
  return 0 if s.nil? or s.empty?
  size = s.size
  dp = Array.new(size)
  dp[size - 1] = [size - 1]
  # puts "#{size - 1}) #{dp[size - 1]}"
  (size - 2).downto(0) do |i|
    res = [i]
    res << i + 1 if s[i] == s[i + 1]
    dp[i + 1].each do |to|
      res << (to + 1) if to + 1< size and s[i] == s[to + 1]
    end

    # puts "#{i}) #{res}"
    dp[i] = res
  end

  # puts "dp is #{dp}"
  dp.reduce(0){|sum, array| sum += array.size}
end

def is_palindromic?(s)
  s == s.reverse
end

s = ARGV[0]
puts "res is #{count_substrings(s)}"

