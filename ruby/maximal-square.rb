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
  max_side = [m,n].min
  res_side = 0
  next_zeros = []

  1.upto(max_side) do |side|
    has_one = false
    0.upto(m - side) do |i|
      0.upto(n - side) do |j|
        if matrix[i][j] == "1"
          has_one = true
          if i + 1 > m - 1 or j + 1 > n - 1 or matrix[i][j + 1] != "1" or matrix[i + 1][j] != "1" or matrix[i + 1][j + 1] != "1"
            next_zeros << [i,j]
          end
        end
      end
    end
    break unless has_one
    res_side = side
    # puts "zerors is #{next_zeros}"
    next_zeros.each { |i,j| matrix[i][j] = "0"}
    # puts "side is #{side} ) new matrix #{matrix}"
    next_zeros = []
  end

  res_side ** 2
end

matrix = ARGV[0][2...-2].split("],[").map { |e| e.split(",") }
puts "matrix is #{matrix}"
puts "res is #{maximal_square(matrix)}"