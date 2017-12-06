#!/usr/bin/env ruby

# Find the contiguous subarray within an array (containing at least one number) which has the largest sum.

# For example, given the array [-2,1,-3,4,-1,2,1,-5,4],
# the contiguous subarray [4,-1,2,1] has the largest sum = 6.

# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  return 0 if nums.nil? or nums.empty?
  size = nums.size
  dp = Array.new(size + 1, 0)
  max = nums[0]
  0.upto(size - 1) do |i|
    i.upto(size - 1) do |j|
      dp[j + 1] = nums[j] + dp[j] if i == 0
      res = dp[j + 1] - dp[i]
      max = res if res > max
    end
  end
  max
end

nums_string = ARGV[0]
nums = nums_string[1...-1].split(",").map{|x| x.to_i}
puts "nums are #{nums}"
puts "res is #{max_sub_array(nums)}"
