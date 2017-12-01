#!/usr/bin/env ruby

# Write a program to solve a Sudoku puzzle by filling the empty cells.

# Empty cells are indicated by the character '.'.

# You may assume that there will be only one unique solution.

# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve_sudoku(board)
  sudoku_solve?(board)
  board
end

def sudoku_solve?(board)
  # print_board(board)
  0.upto(8) do |i|  
    0.upto(8) do |j|
      next unless board[i][j] == "."

      options = options(i,j,board)
      # puts "Options of node #{[i,j]} (#{options(i,j,board)})"
      options.each do |value|
        # puts "Try node #{[i,j]} with value #{value} (#{options(i,j,board)})"
        board[i][j] = value
        res = sudoku_solve?(board)
        # puts "Try node #{[i,j]} with value #{value} res #{res}"
        return true if res
        board[i][j] = "."
      end
      return false
    end
  end
  
  return true
end

def options(i,j,board)
  return [] unless board[i][j] == "."
  # row
  row = get_options_from_nums(Array.new(9){ |idx| board[i][idx] })
  
  # col
  col = get_options_from_nums(Array.new(9){ |idx| board[idx][j] })
  
  # block
  block_row, block_col = i / 3, j / 3
  block_rows, block_cols = [0,1,2].map { |x| x + 3 * block_row }, [0,1,2].map { |x| x + 3 * block_col }
  block = get_options_from_nums(block_rows.product(block_cols).map{|x, y| board[x][y]})

  row & col & block
end

def get_options_from_nums(nums)
  res = ("1".upto("9")).to_a
  nums.each { |x| res.delete(x) unless x == "." }
  res
end

def print_board(board)
  puts "current board is ====="
  board.each_with_index {|row, idx| puts "#{idx}) #{row}"}
  puts "====="
end



board_str = ARGV[0]
board = board_str[2...-2].split("],[").map { |e| e.split(",") }
puts "board is #{board}"
print_board(board)
solve_sudoku(board)
print_board(board)