#!/usr/bin/env ruby

# Determine if a Sudoku is valid, according to: Sudoku Puzzles - The Rules.

# The Sudoku board could be partially filled, 
# where empty cells are filled with the character '.'.

# Note:
# A valid Sudoku board (partially filled) is not necessarily solvable. 
# Only the filled cells need to be validated.

# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)

  0.upto(8) do |i|
    puts "Going i - #{i}"
    # row
    return false unless is_valid_nums(Array.new(9){ |j| board[i][j] })
    # column
    return false unless is_valid_nums(Array.new(9){ |j| board[j][i] })
    # block
    div, mod = i.divmod 3
    block_row = [0,1,2].map { |e| e + 3 * div }
    block_col = [0,1,2].map { |e| e + 3 * mod }

    puts "block #{[block_row, block_col]}"

    return false unless is_valid_nums(block_row.product(block_col).map{ |x,y|  board[x][y]})
  end

  return true
end

def is_valid_nums(nums)
  puts "Check nums #{nums}"
  count_array = Array.new(9) { false }
  nums.each do |x| 
    next if x == "."
    return false if count_array[x.to_i - 1]
    count_array[x.to_i - 1] = true
  end

  return true
end

board_str = ARGV[0]
board = board_str[2...-2].split("],[").map { |e| e.split(",") }
puts "board is #{board}"
puts "res is #{is_valid_sudoku(board)}"