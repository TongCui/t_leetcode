#!/usr/bin/env ruby

# Given an array with n objects colored red, white or blue, sort them so that objects of the same color are adjacent, with the colors in the order red, white and blue.

# Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.

# Note:
# You are not suppose to use the library's sort function for this problem.

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def sort_colors(nums)
  counts = Array.new(3, 0)
  nums.each do |num|
    counts[num] += 1
  end

  idx = 0
  counts.each_with_index do |count, value|
    1.upto(count) do |c|
      nums[idx] = value
      idx += 1
    end
  end
  nums
end

nums = ARGV[0][1...-1].split(",").map { |e| e.to_i }
puts "nums are #{nums}"
sort_colors(nums)
puts "nums are #{nums}"