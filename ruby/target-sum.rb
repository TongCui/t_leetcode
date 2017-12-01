#!/usr/bin/env ruby

# You are given a list of non-negative integers, a1, a2, ..., an, and a target, S. Now you have 2 symbols + and -. For each integer, you should choose one from + and - as its new symbol.

# Find out how many ways to assign symbols to make sum of integers equal to target S.

# Example 1:
# Input: nums is [1, 1, 1, 1, 1], S is 3. 
# Output: 5
# Explanation: 

# -1+1+1+1+1 = 3
# +1-1+1+1+1 = 3
# +1+1-1+1+1 = 3
# +1+1+1-1+1 = 3
# +1+1+1+1-1 = 3

# There are 5 ways to assign symbols to make the sum of nums be target 3.
# Note:
# The length of the given array is positive and will not exceed 20.
# The sum of elements in the given array will not exceed 1000.
# Your output answer is guaranteed to be fitted in a 32-bit integer.

# @param {Integer[]} nums
# @param {Integer} s
# @return {Integer}
def find_target_sum_ways(nums, s)
  return 0 if nums.nil? or nums.empty?
  dp = {}
  find_target_sum_ways_to(nums, nums.size - 1, s, dp)
  # puts "dp is #{dp}"
  dp[key(nums.size - 1, s)]
end

def find_target_sum_ways_to(nums, to, s, dp)
  key = key(to, s)
  return dp[key] if dp.include? key
  res = 0
  if to == 0
    if nums[0] == 0 and s == 0
      res = 2
    elsif (nums[0] == s or nums[0] == -s)
      res = 1
    end
  elsif to > 0

    temp1 = find_target_sum_ways_to(nums, to - 1, s - nums[to], dp)
    temp2 = find_target_sum_ways_to(nums, to - 1, s + nums[to], dp)
    res = temp1 + temp2
  end
  dp[key] = res
end

def key(to, s)
  "#{to}-#{s}"
end


nums = ARGV[0][1...-1].split(",").map { |e| e.to_i }
n = ARGV[1].to_i
puts "nums are #{nums} n is #{n}"
puts "res is #{find_target_sum_ways(nums, n)}"

