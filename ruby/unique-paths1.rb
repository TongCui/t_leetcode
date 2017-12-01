#!/usr/bin/env ruby

# A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

# The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

# How many possible unique paths are there?

# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
  m, n = [n, m] if m < n
  dp = Array.new(m) { Array.new(n, 0)}
  dp[0] = Array.new(n, 1)
  1.upto(m - 1) do |i|
    dp[i][0] = 1
    1.upto(i) do |j|
      left_i, left_j = i - 1 > j ? [i - 1, j] : [j, i - 1]
      top_i, top_j = i > j - 1 ? [i, j - 1] : [j - 1, i]
      dp[i][j] = dp[left_i][left_j] + dp[top_i][top_j]
    end
  end
  puts "dp is #{dp}"
  dp[m - 1][n - 1] 
end

m, n = ARGV[0].to_i, ARGV[1].to_i
puts "m,n #{[m,n]}"
puts "res #{unique_paths(m,n)}"