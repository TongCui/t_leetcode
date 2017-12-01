#!/usr/bin/env ruby

# A message containing letters from A-Z is being encoded to numbers using the following mapping:

# 'A' -> 1
# 'B' -> 2
# ...
# 'Z' -> 26
# Given an encoded message containing digits, determine the total number of ways to decode it.

# For example,
# Given encoded message "12", it could be decoded as "AB" (1 2) or "L" (12).

# The number of ways decoding "12" is 2.

# @param {String} s
# @return {Integer}
def num_decodings(s)
  return 0 if s.nil? or s.empty?
  
  last_1 = s[-1] == '0' ? 0 : 1
  last_2 = 1
  (s.size - 2).downto(0) do |i|
    current = if s[i] == '0'
      0
    elsif s[i,2].to_i <= 26
      last_1 + last_2
    else
      last_1
    end
    last_2, last_1 = last_1, current
  end
  last_1
end


s = ARGV[0]

puts "s is #{s}"
puts "res is #{num_decodings(s)}"