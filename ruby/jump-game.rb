#!/usr/bin/env ruby

# Given an array of non-negative integers, you are initially positioned at the first index of the array.

# Each element in the array represents your maximum jump length at that position.

# Determine if you are able to reach the last index.

# For example:
# A = [2,3,1,1,4], return true.

# A = [3,2,1,0,4], return false.

# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
  last_true = nums.size - 1

  (nums.size - 2).downto(0) do |i|
    last_true = i if nums[i] != 0 and nums[i] + i >= last_true
  end

  last_true == 0
end

nums = ARGV[0][1...-1].split(",").map{|e|e.to_i}
puts "nums are #{nums}"
puts "res is #{can_jump(nums)}"