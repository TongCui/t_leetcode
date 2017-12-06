#!/usr/bin/env ruby

# You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

# Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.

# Credits:
# Special thanks to @ifanchu for adding this problem and creating all test cases. Also thanks to @ts for adding additional test cases.

# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
  return 0 if nums.nil? or nums.empty?
  
  dp = Array.new(nums.size, 0)
  
  nums.each_with_index do |num, idx|
    dp[idx + 1] = if idx == 0
      num
    elsif idx == 1
      [nums[0], num].max
    else
      option1 = dp[idx]
      option2 = dp[idx - 1] + num
      [option1, option2].max
    end
    
  end 
  
  dp[nums.size]
end

nums_string = ARGV[0]
nums = nums_string[1...-1].split(",").map{|x| x.to_i}
puts "nums are #{nums}"
puts "res is #{rob(nums)}"

