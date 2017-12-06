#!/usr/bin/env ruby

# Find the contiguous subarray within an array (containing at least one number) which has the largest product.

# For example, given the array [2,3,-2,4],
# the contiguous subarray [2,3] has the largest product = 6

# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
  return 0 if nums.nil? or nums.empty?
  max = nums[0]
  last_positive, last_negative = nil, nil
  
  nums.each do |num|
    case num <=> 0
    when 0
      last_positive, last_negative = 0, 0
    when 1
      last_positive, last_negative = (last_positive ? [last_positive * num, num].max : num), (last_negative ? last_negative * num : nil)
    when -1
      last_positive, last_negative = (last_negative ? last_negative * num : nil), (last_positive ? [last_positive * num, num].min : num)
    end
    max = [max, last_positive].max if last_positive

    # puts "num #{num}), last_positive, last_negative, #{[last_positive, last_negative]}"
  end 

  max
end

nums = ARGV[0][1...-1].split(",").map{|e|e.to_i}
puts "nums are #{nums}"
puts "res is #{max_product(nums)}"