#!/usr/bin/env ruby

# Given two integer arrays A and B, return the maximum length of an subarray that appears in both arrays.

# Example 1:
# Input:
# A: [1,2,3,2,1]
# B: [3,2,1,4,7]
# Output: 3
# Explanation: 
# The repeated subarray with maximum length is [3, 2, 1].
# Note:
# 1 <= len(A), len(B) <= 1000
# 0 <= A[i], B[i] < 100

# @param {Integer[]} a
# @param {Integer[]} b
# @return {Integer}
def find_length(a, b)
  return 0 if a.empty? or b.empty?
  dp = Array.new(a.size + 1) { |i| Array.new(b.size + 1, 0) }
  max = 0
  (a.size - 1).downto(0) do |i|
    (b.size - 1).downto(0) do |j|
      if a[i] == b[j]
        res_ij = dp[i + 1][j + 1] + 1
        dp[i][j] = res_ij
        max = res_ij if res_ij > max
      end
    end
  end
  # puts "dp is"
  # dp.each_with_index {|row, idx| puts "#{idx}) #{row}"}
  max
end



nums0 = ARGV[0][1...-1].split(",").map{|x| x.to_i }
nums1 = ARGV[1][1...-1].split(",").map{|x| x.to_i }
puts "nums0 are #{nums0}"
puts "nums1 are #{nums1}"
puts "res is #{find_length(nums0, nums1)}"
