#!/usr/bin/env ruby

# Given a 2D binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.

# For example, given the following matrix:

# 1 0 1 0 0
# 1 0 1 1 1
# 1 1 1 1 1
# 1 0 0 1 0
# Return 4.

# @param {Character[][]} matrix
# @return {Integer}
def maximal_square(matrix)
  return 0 if matrix.nil? or matrix.empty?
  m, n = matrix.size, matrix[0].size
  dp = Array.new(m + 1) { Array.new(n + 1, 0) }
  max_side = 0
  0.upto(m - 1) do |i|
    0.upto(n - 1) do |j|
      if matrix[i][j] == "1"
        dp[i][j] = [dp[i - 1][j], dp[i - 1][j - 1], dp[i][j - 1]].min + 1
        max_side = [max_side, dp[i][j]].max
      end
    end
  end

  max_side ** 2
end

matrix = ARGV[0][2...-2].split("],[").map { |e| e.split(",") }
puts "matrix is #{matrix}"
puts "res is #{maximal_square(matrix)}"