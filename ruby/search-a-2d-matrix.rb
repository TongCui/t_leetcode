#!/usr/bin/env ruby

# Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:

# Integers in each row are sorted from left to right.
# The first integer of each row is greater than the last integer of the previous row.
# For example,

# Consider the following matrix:

# [
#   [1,   3,  5,  7],
#   [10, 11, 16, 20],
#   [23, 30, 34, 50]
# ]
# Given target = 3, return true.

# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  return false if matrix.nil? or matrix.empty?
  m, n = matrix.size, matrix[0].size
  return false if n == 0
  r_lo, r_hi = 0, m - 1
  while r_lo <= r_hi
    r_mid = (r_lo + r_hi) / 2
    if target < matrix[r_mid][0]
      r_hi = r_mid - 1
    elsif target > matrix[r_mid][-1]
      r_lo = r_mid + 1 
    else
      c_lo, c_hi = 0, n - 1
      while c_lo <= c_hi
        c_mid = (c_lo + c_hi) / 2
        case matrix[r_mid][c_mid] <=> target
        when 0; return true
        when 1; c_hi = c_mid - 1
        when -1; c_lo = c_mid + 1
        end
      end
      return false
    end
  end

  return false
end

[[1,3,5,7],[10,11,16,20],[23,30,34,50]]

matrix = ARGV[0][2...-2].split("],[").map { |e| e.split(",").map { |x| x.to_i } }
target = ARGV[1].to_i
puts "matrix is #{matrix}, target is #{target}"
puts "res is #{search_matrix(matrix, target)}"