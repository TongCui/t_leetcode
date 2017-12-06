#!/usr/bin/env ruby

# Find the contiguous subarray within an array (containing at least one number) which has the largest product.

# For example, given the array [2,3,-2,4],
# the contiguous subarray [2,3] has the largest product = 6

# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
  return 0 if nums.nil? or nums.empty?
  max = min = res = nums[0]

  1.upto(nums.size - 1) do |i|
    num = nums[i]
    max, min = [num, num * max, num * min].max, [num, num * max, num * min].min
    res = [max, res].max
    # puts "#{num}) min max #{[min, max]} - res #{res}"

  end 

  res
end

nums = ARGV[0][1...-1].split(",").map{|e|e.to_i}
puts "nums are #{nums}"
puts "res is #{max_product(nums)}"