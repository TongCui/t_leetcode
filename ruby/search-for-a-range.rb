#!/usr/bin/env ruby
# Given an array of integers sorted in ascending order, find the starting and ending position of a given target value.

# Your algorithm's runtime complexity must be in the order of O(log n).

# If the target is not found in the array, return [-1, -1].

# For example,
# Given [5, 7, 7, 8, 8, 10] and target value 8,
# return [3, 4].

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
  from_idx = nums.bsearch_index {|x| x >= target}
  return [-1, -1] if from_idx.nil? or nums[from_idx] != target
  end_idx = nums[from_idx..-1].bsearch_index {|x| x > target}
  end_idx = end_idx ? from_idx + end_idx - 1 : nums.count - 1
    
  [from_idx, end_idx]
end

nums_str = ARGV.first
target = ARGV.last.to_i
nums = nums_str.chars.map { |e| e.to_i }
puts "input nums #{nums}"
puts "target is #{target}"

puts "res #{search_range(nums, target)}"