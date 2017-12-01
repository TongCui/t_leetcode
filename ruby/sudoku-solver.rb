#!/usr/bin/env ruby

# Write a program to solve a Sudoku puzzle by filling the empty cells.

# Empty cells are indicated by the character '.'.

# You may assume that there will be only one unique solution.

class Option
  attr_accessor :i, :j, :valid_nums
  def initialize(i,j,board)
    @i = i
    @j = j
    @valid_nums = get_options(i,j,board)
    puts "Init Option #{[i,j]} options #{@valid_nums}"
  end

  def get_options(i,j,board)
    return [] unless board[i][j] == "."
    res = []
    # row
    res = get_options_from_nums(Array.new(9){ |idx| board[i][idx] })
    # puts "row options is #{res}"
    return res if res.size <= 1
    # col
    col_options = get_options_from_nums(Array.new(9){ |idx| board[idx][j] })
    # puts "col options is #{col_options}"
    res = res & col_options
    return res if res.size <= 1
    # block
    block_row, block_col = i / 3, j / 3
    block_rows, block_cols = [0,1,2].map { |x| x + 3 * block_row }, [0,1,2].map { |x| x + 3 * block_col }
    block_options = get_options_from_nums(block_rows.product(block_cols).map{|x, y| board[x][y]})
    # puts "block options is #{block_rows}, #{block_cols} #{block_options}"
    res = res & block_options
    return res
  end

  def get_options_from_nums(nums)
    res = (1..9).map{ |x| x.to_s }
    nums.each do |x| 
      res.delete(x) unless x == "."
    end
    res
  end

end

def print_board(board)
  board.each_with_index {|row, idx| puts "#{idx}) #{row}"}
end

# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve_sudoku(board)
  options = []
  0.upto(8) do |i|
    0.upto(8) do |j|
      if board[i][j] == "."
        options.push Option.new(i,j,board)
      end
    end
  end

  sorted_options = options.sort{|a, b| a.valid_nums.size <=> b.valid_nums.size}

  
end



board_str = ARGV[0]
board = board_str[2...-2].split("],[").map { |e| e.split(",") }
puts "board is #{board}"
print_board(board)
solve_sudoku(board)
print_board(board)