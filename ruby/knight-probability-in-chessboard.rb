#!/usr/bin/env ruby

# On an NxN chessboard, a knight starts at the r-th row and c-th column and attempts to make exactly K moves. The rows and columns are 0 indexed, so the top-left square is (0, 0), and the bottom-right square is (N-1, N-1).

# A chess knight has 8 possible moves it can make, as illustrated below. Each move is two squares in a cardinal direction, then one square in an orthogonal direction.


# Each time the knight is to move, it chooses one of eight possible moves uniformly at random (even if the piece would go off the chessboard) and moves there.

# The knight continues moving until it has made exactly K moves or has moved off the chessboard. Return the probability that the knight remains on the board after it has stopped moving.

# Example:
# Input: 3, 2, 0, 0
# Output: 0.0625
# Explanation: There are two moves (to (1,2), (2,1)) that will keep the knight on the board.
# From each of those positions, there are also two moves that will keep the knight on the board.
# The total probability the knight stays on the board is 0.0625.
# Note:
# N will be between 1 and 25.
# K will be between 0 and 100.
# The knight always initially starts on the board.

# @param {Integer} n
# @param {Integer} k
# @param {Integer} r
# @param {Integer} c
# @return {Float}
# @param {Integer} n
# @param {Integer} k
# @param {Integer} r
# @param {Integer} c
# @return {Float}
def knight_probability(n, k, r, c)
  return 1.0 if k == 0

  knight_next = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
  div, mod = n.divmod 2
  mid = (mod == 0 ? div - 1 : div)
  steps = Array.new(mid + 1) { Array.new(mid + 1, nil) }

  0.upto(mid) do |i|
    i.upto(mid) do |j|
      steps[i][j] = knight_next.map { |x, y|  [i + x, j + y]}
      .select {|x, y| valid?(n, x, y)}
      .map{|x, y| mirror_position(n, x, y)}
    end
  end

  # puts "steps #{steps}"
  book = {}
  r, c = mirror_position(n, r, c)
  probability(k, r, c, steps, book)
end

def key(k,i,j)
  [k,i,j].join "|"
end

def probability(k, i, j, steps, book)
  key = key(k,i,j)
  return book[key] if book.include? key
  res = if k == 1
    steps[i][j].size / 8.0
  else
    steps[i][j].map{|x, y| probability(k - 1, x, y, steps, book) }.reduce(0, :+) / 8.0  
  end

  # puts "k,i,j #{[k,i,j]} res #{res} #{steps[i][j]}"
  book[key] = res
  res
end

def valid?(n, i, j)
  i >= 0 and j >= 0 and i < n and j < n 
end

def mirror_position(n, r, c)
  mirror_r, mirror_c = [[n - 1 - r, r].min, [n - 1 - c, c].min]
  mirror_r < mirror_c ? [mirror_r, mirror_c] : [mirror_c, mirror_r]
end


n,k,r,c = ARGV.map { |e| e.to_i  }
puts "params are #{[n,k,r,c]}"
puts "res #{knight_probability(n,k,r,c)}"
