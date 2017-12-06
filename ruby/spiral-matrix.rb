#!/usr/bin/env ruby

# Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.

# For example,
# Given the following matrix:

# [
#  [ 1, 2, 3 ],
#  [ 4, 5, 6 ],
#  [ 7, 8, 9 ]
# ]
# You should return [1,2,3,6,9,8,7,4,5].

# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
  return [] if matrix.nil? or matrix.empty?
  m, n = matrix.size, matrix[0].size
  left, top, right, bottom = 0, 0, n - 1, m - 1
  res = []

  while true
    # move right
    left.upto(right) { |i| res << matrix[top][i] }
    top += 1
    break if top > bottom
    # move down
    top.upto(bottom) { |i| res << matrix[i][right] }
    right -= 1
    break if left > right
    # move left
    right.downto(left) { |i| res << matrix[bottom][i]}
    bottom -= 1
    break if top > bottom
    # move up
    bottom.downto(top) { |i| res << matrix[i][left]}
    left += 1
    break if left > right
  end
  
  res

end

nums = ARGV[0][2...-2].split("],[").map { |s| s.split(",").map{|e| e.to_i} }
puts "nums are #{nums}"
puts "res #{spiral_order(nums)}"