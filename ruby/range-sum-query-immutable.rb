#!/usr/bin/env ruby

# Given an integer array nums, find the sum of the elements between indices i and j (i ≤ j), inclusive.

# Example:
# Given nums = [-2, 0, 3, -5, 2, -1]

# sumRange(0, 2) -> 1
# sumRange(2, 5) -> -1
# sumRange(0, 5) -> -3
# Note:
# You may assume that the array does not change.
# There are many calls to sumRange function.

class NumArray

=begin
    :type nums: Integer[]
=end
    attr_accessor :dp

    def initialize(nums)
      @dp = Array.new(nums.size + 1, 0)
      nums.each_with_index do |num, idx|
        @dp[idx + 1] = num + @dp[idx]
      end
    end


=begin
    :type i: Integer
    :type j: Integer
    :rtype: Integer
=end
    def sum_range(i, j)
      return nil if i > j
      return @dp[j + 1] - @dp[i]
    end


end

# Your NumArray object will be instantiated and called as such:
nums = [-1]
obj = NumArray.new(nums)
puts obj.sum_range(0, 0)
# puts obj.sum_range(2, 5)
# puts obj.sum_range(0, 5)
# puts obj.sum_range(0, 1)
# puts obj.sum_range(1, 1)


