#!/usr/bin/env ruby

# There is an m by n grid with a ball. Given the start coordinate (i,j) of the ball, you can move the ball to adjacent cell or cross the grid boundary in four directions (up, down, left, right). However, you can at most move N times. Find out the number of paths to move the ball out of grid boundary. The answer may be very large, return it after mod 109 + 7.

# Note:
# Once you move the ball out of boundary, you cannot move it back.
# The length and height of the grid is in range [1,50].
# N is in range [0,50].

# @param {Integer} m
# @param {Integer} n
# @param {Integer} s
# @param {Integer} i
# @param {Integer} j
# @return {Integer}
def find_paths(m, n, s, i, j)
  boundary_paths(m,n,s,i,j,{})
end

def boundary_paths(m, n, s, i, j, book) 
  return 0 if s == 0
  i = [i, m - 1 - i].min
  j = [j, n - 1 - j].min
  key = "#{s}-#{i}-#{j}"
  return book[key] if book.include? key
  res = 0
  [[-1,0],[0,-1],[0,1],[1,0]].map {|x, y| [x + i, y + j] }.each do |x, y|
    if x < 0 or x >= m or y < 0 or y >= n 
      res += 1
    else
      res += boundary_paths(m, n, s-1, x, y, book)
    end
  end

  res %= 10**9 + 7

  book[key] = res
end

m, n, s, i, j = 50, 50, 50, 0, 0
puts "res is #{find_paths(m, n, s, i, j)}"