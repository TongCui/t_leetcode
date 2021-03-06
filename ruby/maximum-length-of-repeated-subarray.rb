#!/usr/bin/env ruby

# Given two integer arrays A and B, return the maximum length of an subarray that appears in both arrays.

# Example 1:
# Input:
# A: [1,2,3,2,1]
# B: [3,2,1,4,7]
# Output: 3
# Explanation: 
# The repeated subarray with maximum length is [3, 2, 1].
# Note:
# 1 <= len(A), len(B) <= 1000
# 0 <= A[i], B[i] < 100

# @param {Integer[]} a
# @param {Integer[]} b
# @return {Integer}
def find_length(a, b)
  return 0 if a.empty? or b.empty?
  book = {}
  res = max_length(a, b, a.size - 1, b.size - 1, book) 
  puts "final res is #{res}"
  res.size
end

def max_length(a, b, a_last_idx, b_last_idx, book)
  key = "#{a_last_idx}-#{b_last_idx}" 
  return book[key] if book.include?(key)

  res = if a_last_idx == 0
    b[0..b_last_idx].include?(a[0]) ? [a[0]] : []
  elsif b_last_idx == 0
    a[0..a_last_idx].include?(b[0]) ? [b[0]] : []
  elsif a[a_last_idx] == b[b_last_idx]
    max_length(a, b, a_last_idx - 1, b_last_idx - 1, book).clone <<  a[a_last_idx] 
  else
    sub_res0 = max_length(a, b, a_last_idx, b_last_idx - 1, book)
    sub_res1 = max_length(a, b, a_last_idx - 1, b_last_idx, book)
    sub_res0.size > sub_res1.size ? sub_res0.clone : sub_res1.clone
  end

  puts "Last Index #{[a_last_idx, b_last_idx]} with res #{res}"
  book[key] = res
end



nums0 = ARGV[0][1...-1].split(",").map{|x| x.to_i }
nums1 = ARGV[1][1...-1].split(",").map{|x| x.to_i }
puts "nums0 are #{nums0}"
puts "nums1 are #{nums1}"
puts "res is #{find_length(nums0, nums1)}"
