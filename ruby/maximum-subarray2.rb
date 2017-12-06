#!/usr/bin/env ruby

# Find the contiguous subarray within an array (containing at least one number) which has the largest sum.

# For example, given the array [-2,1,-3,4,-1,2,1,-5,4],
# the contiguous subarray [4,-1,2,1] has the largest sum = 6.

# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  return 0 if nums.nil? or nums.empty?
  
  max_end = 0
  max_whole = nums[0]

  nums.each do |num|
    max_end = [max_end + num, num].max
    max_whole = max_end if max_end > max_whole
  end

  max_whole
end

nums_string = ARGV[0]
nums = nums_string[1...-1].split(",").map{|x| x.to_i}
puts "nums are #{nums}"
puts "res is #{max_sub_array(nums)}"
