#!/usr/bin/env ruby

# Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.

# Note: You can only move either down or right at any point in time.

# Example 1:
# [[1,3,1],
#  [1,5,1],
#  [4,2,1]]
# Given the above grid map, return 7. Because the path 1→3→1→1→1 minimizes the sum.

# @param {Integer[][]} grid
# @return {Integer}
def min_path_sum(grid)
  m = grid.size
  n = grid[0].size

  dp = Array.new(m) { Array.new(n, 0) }
  dp[0][0] = grid[0][0]
  1.upto(n - 1) { |j| dp[0][j] = dp[0][j - 1] + grid[0][j] }
  1.upto(m - 1) do |i|
    dp[i][0] = dp[i - 1][0] + grid[i][0]
    1.upto(n - 1) do |j|
      dp[i][j] = [dp[i - 1][j] + grid[i][j], dp[i][j - 1] + grid[i][j]].min
    end
  end

  puts "dp is #{dp}"
  dp[m - 1][n - 1]
end

grid = ARGV[0][2...-2].split("],[").map { |e| e.split(",").map { |x| x.to_i } }
puts "grid is #{grid}"
puts "res #{min_path_sum(grid)}"