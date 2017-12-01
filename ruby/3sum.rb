#!/usr/bin/env ruby

# @param {Integer[]} nums
# @return {Integer[][]}

def count_size_value(nums, count, size, value, book)
  key = [count, size, value].join("-")
  if book.has_key? key
    return book[key]
  end

  res = []

  if count == 1
    res = nums[0, size].select{ |x| x == value }.map { |x| [x] }
  elsif count > size
    res = []
  else
    temp1 = count_size_value(nums, count, size - 1, value, book)
    temp1.each do |array|
      res.push array.clone
    end
    
    temp2 = count_size_value(nums, count - 1, size - 1, value - nums[size-1], book)
    temp2.each do |array|
      res.push(array.clone.push(nums[size-1]))
    end
  end

  # puts "Going count(#{count})-size(#{size})-value(#{value})"
  # puts "Result #{res}"
  # puts ">>>>>>>>>End<<<<<<<<"
  book[key] = res
  return res
end

def three_sum(nums)
  book = {}
  return count_size_value(nums.sort, 3, nums.size, 0, book).uniq
end


inputs = []
expects = []

# inputs.push [-1, 0, 1, 2, -1, -4]
# expects.push [[-1, 0, 1],[-1, -1, 2]]

inputs.push [0,8,2,-9,-14,5,2,-5,-5,-9,-1,3,1,-8,0,-3,-12,2,11,9,13,-14,2,-15,4,10,9,7,14,-8,-2,-1,-15,-15,-2,8,-3,7,-12,8,6,2,-12,-8,1,-4,-3,5,13,-7,-1,11,-13,8,4,6,3,-2,-2,3,-2,3,9,-10,-4,-8,14,8,7,9,1,-2,-3,5,5,5,8,9,-5,6,-12,1,-5,12,-6,14,3,5,-11,8,-7,2,-12,9,8,-1,9,-1,-7,1,-7,1,14,-3,13,-4,-12,6,-9,-10,-10,-14,7,0,13,8,-9,1,-2,-5,-14]
expects.push []

# inputs.push []
# expects.push []

inputs.zip(expects).each do |input, expect|
  puts "========"
  puts "input - #{input}"
  res = three_sum(input)
  puts "Result (#{res == expect ? 'Success' : 'Failed'})"
  puts "Res : #{res}"
  puts "Expect : #{expect}"
end