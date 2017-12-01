#!/usr/bin/env ruby

# Given a non-negative integer represented as a non-empty array of digits, plus one to the integer.

# You may assume the integer do not contain any leading zero, except the number 0 itself.

# The digits are stored such that the most significant digit is at the head of the list.

# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
  pre = 1
  digits.to_enum.with_index.reverse_each do |digit, idx|
    break if pre == 0
    pre, res = (digit + pre).divmod 10
    digits[idx] = res
  end

  digits.unshift(pre) unless pre == 0
    
  digits
end

digits = ARGV[0].chars.map{|c| c.to_i}
puts "digits are #{digits}"
puts "res is #{plus_one(digits)}"