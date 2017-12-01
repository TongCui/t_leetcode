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
  sub_s = []
  break_i = 0
  0.upto(s.size - 1) do |i|
    if s[i] == "0"
      if i > 0 and (1..26).include?(s[i - 1, 2].to_i)
        sub_s << s[break_i..(i - 2)] if break_i < i - 2
        break_i = i + 1
      else
        return 0
      end
    end
  end

  sub_s << s[break_i..-1] if break_i < s.size  
  
  puts "sub_s #{sub_s}"
  sub_s.map {|x| no_zero_num_docodings(x)}.reduce(1, :*)
end

def no_zero_num_docodings(s)
  last_2 = 1
  last_1 = 1
  
  1.upto(s.size - 1) do |i|
    res = if s[i] == "0"
      last_2
    elsif (1..26).include?(s[i - 1, 2].to_i)
      last_2 + last_1
    else
      last_1
    end
    last_2, last_1 = last_1, res
  end

  last_1
end

s = ARGV[0]

puts "s is #{s}"
puts "res is #{num_decodings(s)}"