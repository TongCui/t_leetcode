#!/usr/bin/env ruby

# Given an integer n, generate a square matrix filled with elements from 1 to n2 in spiral order.

# For example,
# Given n = 3,

# You should return the following matrix:
# [
#  [ 1, 2, 3 ],
#  [ 8, 9, 4 ],
#  [ 7, 6, 5 ]
# ]

# @param {Integer[][]} matrix
# @return {Integer[]}
def generate_matrix(n)
  
  left, top, right, bottom = 0, 0, n - 1, n - 1
  res = Array.new(n) { Array.new(n)}
  number = 1
  max = n ** 2
  while number <= max
    # move right
    left.upto(right) { |i| res[top][i] = number ; number += 1 }
    top += 1
    break if number > max
    # move down
    top.upto(bottom) { |i| res[i][right] = number ; number += 1 }
    right -= 1
    break if number > max
    # move left
    right.downto(left) { |i| res[bottom][i] = number ; number += 1 }
    bottom -= 1
    break if number > max
    # move up
    bottom.downto(top) { |i| res[i][left] = number ; number += 1 }
    left += 1
    break if number > max
  end
  
  res

end

n = ARGV[0].to_i
puts "n is #{n}"
puts "res #{generate_matrix(n)}"