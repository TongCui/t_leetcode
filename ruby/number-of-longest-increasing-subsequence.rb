#!/usr/bin/env ruby

# Given an unsorted array of integers, find the number of longest increasing subsequence.

# Example 1:
# Input: [1,3,5,4,7]
# Output: 2
# Explanation: The two longest increasing subsequence are [1, 3, 4, 7] and [1, 3, 5, 7].
# Example 2:
# Input: [2,2,2,2,2]
# Output: 5
# Explanation: The length of longest continuous increasing subsequence is 1, and there are 5 subsequences' length is 1, so output 5.
# Note: Length of the given array will be not exceed 2000 and the answer is guaranteed to be fit in 32-bit signed int.

# @param {Integer[]} nums
# @return {Integer}
def find_number_of_lis(nums)
  return 0 if nums.nil? or nums.empty?
  size = nums.size
  dp = Array.new(size) {[0,0]}
  max_size = 0
  max_size_count = 0
  0.upto(size - 1) do |i|
    temp_max_size, temp_max_size_count = 1, 1
    0.upto(i - 1) do |j|
      if nums[i] > nums[j]
        j_max_size, j_max_size_count = dp[j]
        if j_max_size + 1 > temp_max_size
          temp_max_size = j_max_size + 1
          temp_max_size_count = j_max_size_count
        elsif j_max_size + 1 == temp_max_size
          temp_max_size_count += j_max_size_count
        end
      end
    end
    dp[i] = [temp_max_size, temp_max_size_count]
    puts "#{i})res #{dp[i]}"
    case temp_max_size <=> max_size
    when 1
      max_size, max_size_count = temp_max_size, temp_max_size_count
    when 0
      max_size_count += temp_max_size_count
    end
  end

  max_size_count
end


nums = ARGV[0][1...-1].split(",").map{|x| x.to_i }

puts "nums are #{nums}"
puts "res #{find_number_of_lis(nums)}"