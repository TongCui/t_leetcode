#!/usr/bin/env ruby

# You are given an n x n 2D matrix representing an image.

# Rotate the image by 90 degrees (clockwise).

# Note:
# You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.

# Example 1:

# Given input matrix = 
# [
#   [1,2,3],
#   [4,5,6],
#   [7,8,9]
# ],

# rotate the input matrix in-place such that it becomes:
# [
#   [7,4,1],
#   [8,5,2],
#   [9,6,3]
# ]
# Example 2:

# Given input matrix =
# [
#   [ 5, 1, 9,11],
#   [ 2, 4, 8,10],
#   [13, 3, 6, 7],
#   [15,14,12,16]
# ], 

# rotate the input matrix in-place such that it becomes:
# [
#   [15,13, 2, 5],
#   [14, 3, 4, 1],
#   [12, 6, 8, 9],
#   [16, 7,10,11]
# ]

# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
  n = matrix.size
  0.upto(n / 2) do |i|
    i.upto(mirror(i,n) - 1) do |j|
      # puts "i,j #{[i,j]}) #{[[i,j], [j,mirror(i,n)], [mirror(i,n), mirror(j,n)], [mirror(j,n), i]]}"
      matrix[i][j], matrix[j][mirror(i,n)], matrix[mirror(i,n)][mirror(j,n)], matrix[mirror(j,n)][i] = matrix[mirror(j,n)][i], matrix[i][j], matrix[j][mirror(i,n)], matrix[mirror(i,n)][mirror(j,n)]
    end
  end
  matrix
end

def mirror(x, n)
  n - 1 - x
end

# [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]
matrix = ARGV[0][2...-2].split("],[").map{|x|x.split(",").map{|x|x.to_i}}
puts "matrix #{matrix}"
rotate(matrix)
puts "rotated matrix #{matrix}"











