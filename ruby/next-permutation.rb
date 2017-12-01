#!/usr/bin/env ruby

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def next_permutation(nums)
  target_i = (nums.count - 1).downto(1).find { |i| nums[i - 1] < nums[i] }
  puts "Found target i #{target_i}"
  if target_i
    swap_i = (nums.count - 1).downto(target_i).find { |i| nums[i] > nums[target_i - 1] }
    puts "Found swap i #{swap_i}"
    nums[target_i - 1], nums[swap_i] = nums[swap_i], nums[target_i - 1]
    nums[target_i..-1] = nums[target_i..-1].reverse! if target_i < nums.count - 1
  else
    nums.reverse!  
  end
end

nums_str = ARGV.first
nums = nums_str.chars.map { |e| e.to_i }
puts "input nums #{nums}"
next_permutation(nums)
puts "res nums #{nums}"