#!/usr/bin/env ruby

# Follow up for "Unique Paths":

# Now consider if some obstacles are added to the grids. How many unique paths would there be?

# An obstacle and empty space is marked as 1 and 0 respectively in the grid.

# For example,
# There is one obstacle in the middle of a 3x3 grid as illustrated below.

# [
#   [0,0,0],
#   [0,1,0],
#   [0,0,0]
# ]
# The total number of unique paths is 2.

# Note: m and n will be at most 100.

# @param {Integer[][]} obstacle_grid
# @return {Integer}
def unique_paths_with_obstacles(obstacle_grid)
  return 0 if obstacle_grid[0][0] == 1
  m = obstacle_grid.size
  n = obstacle_grid[0].size
  dp = Array.new(m + 1) { Array.new(n + 1, 0)}

  dp[1][1] = 1
  1.upto(m) do |i|
    1.upto(n) do |j|
      next if i == 1 and j == 1
      if obstacle_grid[i - 1][j - 1] == 1
        dp[i][j] = 0
      else
        dp[i][j] = dp[i-1][j] + dp[i][j-1]  
      end
    end
  end
  dp[m][n]
end

grid = ARGV[0][2...-2].split("],[").map { |e| e.split(",").map { |x| x.to_i } }
puts "grid is #{grid}"
puts "res #{unique_paths_with_obstacles(grid)}"