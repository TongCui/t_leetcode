#!/usr/bin/env ruby

# Given a sorted array, remove the duplicates in place such that each element appear only once and return the new length.

# Do not allocate extra space for another array, you must do this in place with constant memory.

# For example,
# Given input array nums = [1,1,2],

# Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively. It doesn't matter what you leave beyond the new length.

# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  return 0 if nums.nil? or nums.empty?
  tail_idx = 0
  1.upto(nums.size - 1) do |idx|  
    if nums[idx] != nums[idx - 1]
      tail_idx += 1
      nums[tail_idx] = nums[idx]
    end
  end

  tail_idx + 1
end

nums_str = ARGV.first
nums = nums_str.chars.map { |e| e.to_i }
puts "input nums #{nums}"

puts "res #{remove_duplicates(nums)}"
puts "new nums #{nums}"