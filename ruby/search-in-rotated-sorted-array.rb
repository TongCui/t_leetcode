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
    puts "l, h, mid is #{[l, h, mid]}"
    puts "nums[mid] <=> target (#{nums[mid] <=> target})"
    case nums[mid] <=> target
    when 0
      return mid
    when 1
      if nums[l] <= nums[mid]
        case nums[l] <=> target
        when 0
          return l
        when 1
          l = mid + 1
        when -1
          l = l + 1
          h = mid - 1
        end
      else 
        h = mid - 1
      end
    when -1
      if nums[mid] <= nums[h]
        case nums[h] <=> target
        when 0
          return h
        when 1
          l = mid + 1
          h = h - 1
        when -1
          h = mid - 1
        end        
      else
        l = mid + 1
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
