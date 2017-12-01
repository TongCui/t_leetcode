#!/usr/bin/env ruby

# Given an array of integers nums and a positive integer k, find whether it's possible to divide this array into k non-empty subsets whose sums are all equal.

# Example 1:
# Input: nums = [4, 3, 2, 3, 5, 2, 1], k = 4
# Output: True
# Explanation: It's possible to divide it into 4 subsets (5), (1, 4), (2,3), (2,3) with equal sums.
# Note:

# 1 <= k <= len(nums) <= 16.
# 0 < nums[i] < 10000.

# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def can_partition_k_subsets(nums, k)
  target, mod = nums.reduce(0, :+).divmod(k)
  return false unless mod == 0
  nums.sort!{|a, b| b<=> a}
  # puts "sorted nums are #{nums}"
  groups = Array.new(k, target) 
  # res = Array.new(k) { []  }
  can_build?(nums, 0, groups)

  # puts "groups #{groups}"
  # puts "res #{res}"
end

def can_build?(nums, idx, groups)
  # puts "idx #{idx}), groups res #{[groups, res]}"
  return groups.all? { |e| e == 0 } if idx == nums.size
  0.upto(groups.size - 1) do |group_idx|
    next if groups[group_idx] < nums[idx]
    groups[group_idx] -= nums[idx]
    # res[group_idx] << nums[idx]
    return true if can_build?(nums, idx + 1, groups)
    groups[group_idx] += nums[idx]
    # res[group_idx].pop
  end
  return false
end


nums = ARGV[0][1...-1].split(",").map{|x| x.to_i }
target = ARGV[1].to_i

puts "nums are #{nums}, with target #{target}"
puts "puts res is #{can_partition_k_subsets(nums, target)}"