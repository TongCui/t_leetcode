#!/usr/bin/env ruby

# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
  return s if s.size <= num_rows or num_rows == 1
  row, col = 0, 0
  group_count = num_rows * 2 - 2
  
  matric = Array.new(num_rows) { "" }
  
  s.each_char do |char|
    # puts "Going to put #{char} on matric[#{row}][#{col}], compute (#{num_rows})"
    matric[row] << char
    if col % (num_rows - 1) == 0 and row < num_rows - 1
      row += 1
    else
      row -= 1
      col += 1
    end    
  end

  matric.join("")
end

inputs0 = []
inputs1 = []
expects = []

# inputs0.push "1234567890"
# inputs1.push 4
# expects.push "1726835940"

inputs0.push "1234567890"
inputs1.push 4
expects.push "1726835940"

# inputs.push []
# expects.push []

expects.zip(inputs0, inputs1).each do |expect, input0, input1|
  puts "========"
  res = convert(input0, input1)
  puts "Result (#{res == expect ? 'Success' : 'Failed'})"
  puts "Res : #{res}"
  puts "Expect : #{expect}"
end