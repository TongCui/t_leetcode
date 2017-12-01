#!/usr/bin/env ruby

# A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

# The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

# How many possible unique paths are there?

# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
  dp = Array.new(m + 1) { Array.new(n + 1, 0)}
  dp[1][1] = 1
  1.upto(m) do |i|
    1.upto(n) do |j|
      next if i == 1 and j == 1
      dp[i][j] = dp[i-1][j] + dp[i][j-1]
    end
  end

  dp[m][n] 
end

m, n = ARGV[0].to_i, ARGV[1].to_i
puts "m,n #{[m,n]}"
puts "res #{unique_paths(m,n)}"