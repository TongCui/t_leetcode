#!/usr/bin/env ruby
# @param {Integer[]} height
# @return {Integer}
def max_area(heights)
  return 0 if heights.count < 2

  cur_i = 0
  cur_j = heights.size - 1
  max_area = 0
  while cur_i < cur_j
    
    area = area(heights, cur_i, cur_j)
    max_area = area if area > max_area
    
    if heights[cur_i] <= heights[cur_j]
      cur_i += 1
    else
      cur_j -= 1
    end
  end


  max_area
end

def area(heights, i, j)
  height = [heights[i], heights[j]].min
  # puts "Compute area from #{i} to #{j}, (#{heights[i]}, #{heights[j]}).min = #{height}"
  (j - i) * height
end

inputs = []
expects = []

# inputs.push [1,1]
# expects.push 1

inputs.push [1,2,8,6,5,1,2,6]
expects.push 1


inputs.zip(expects).each do |input, expect|
  puts "========"
  puts "input - #{input}"
  res = max_area(input)
  puts "Result (#{res == expect ? 'Success' : 'Failed'})"
  puts "Res : #{res}"
  puts "Expect : #{expect}"
end