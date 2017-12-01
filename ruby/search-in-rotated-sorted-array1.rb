#!/usr/bin/env ruby

# Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

# (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).

# You are given a target value to search. If found in the array return its index, otherwise return -1.

# You may assume no duplicate exists in the array

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  l, h = 0, nums.size - 1
  while l <= h
    mid = (l + h) / 2
    # puts "l, h, mid is #{[l, h, mid]}"
    # puts "nums[mid] <=> target (#{nums[mid] <=> target})"
    return mid if nums[mid] == target
    if nums[l] <= nums[mid]
      if (nums[l]..nums[mid]).include? target
        h = mid - 1
      else
        l = mid + 1
      end
    else
      if (nums[mid]..nums[h]).include? target
        l = mid + 1
      else
        h = mid - 1
      end
    end
  end  
  -1
end

nums_str = ARGV.first
target = ARGV.last.to_i
nums = nums_str.chars.map { |e| e.to_i }
puts "input nums #{nums}"
puts "target is #{target}"

puts "res #{search(nums, target)}"
