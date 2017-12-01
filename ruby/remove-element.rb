#!/usr/bin/env ruby

# Given an array and a value, remove all instances of that value in place and return the new length.

# Do not allocate extra space for another array, you must do this in place with constant memory.

# The order of elements can be changed. It doesn't matter what you leave beyond the new length.

# Example:
# Given input array nums = [3,2,2,3], val = 3

# Your function should return length = 2, with the first two elements of nums being 2.

# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element(nums, val)
  return 0 if nums.nil? or nums.empty?
  val_count = 0

  0.upto(nums.size - 1) do |n|  
    if nums[n] == val
      val_count += 1
    else
      nums[n], nums[n - val_count] = nums[n - val_count], nums[n]
    end puts "nums is #{nums}"
  end

  nums.size - val_count
end

nums_str = ARGV.first
target = ARGV.last.to_i
nums = nums_str.chars.map { |e| e.to_i }
puts "input nums #{nums}"
puts "target is #{target}"

puts "res #{remove_element(nums, target)}"