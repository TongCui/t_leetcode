#!/usr/bin/env ruby

# A message containing letters from A-Z is being encoded to numbers using the following mapping way:

# 'A' -> 1
# 'B' -> 2
# ...
# 'Z' -> 26
# Beyond that, now the encoded string can also contain the character '*', which can be treated as one of the numbers from 1 to 9.

# Given the encoded message containing digits and the character '*', return the total number of ways to decode it.

# Also, since the answer may be very large, you should return the output mod 109 + 7.

# Example 1:
# Input: "*"
# Output: 9
# Explanation: The encoded message can be decoded to the string: "A", "B", "C", "D", "E", "F", "G", "H", "I".
# Example 2:
# Input: "1*"
# Output: 9 + 9 = 18
# Note:
# The length of the input string will fit in range [1, 105].
# The input string will only contain the character '*' and digits '0' - '9'.
# "123*08786*6********"

# @param {String} s
# @return {Integer}
def num_decodings(s)
  return 0 if s.nil? or s.empty? or s.start_with?("0")
  size = s.size

  last_2 = 1
  last_1 = s[0] == "*" ? 9 : 1
  1.upto(s.size - 1) do |i|
    
    res = case s[i]
    when "*"
      9 * last_1 + double_options(s[i - 1, 2]) * last_2
    when "0"
      double_options(s[i - 1, 2]) * last_2
    else
      last_1 + double_options(s[i - 1, 2]) * last_2
    end 
    res %= 10**9 + 7

    puts "#{i}) res is #{res}"

    last_2, last_1 = last_1, res
  end

  last_1
end

def double_options(s)
  return 0 if s.start_with? "0"
  res = case s
  when "**"
    15
  when /\*[0-6]/
    2
  when /\*[7-9]/
    1
  when /1\*/
    9
  when /2\*/
    6
  when /[3-9]\*/
    0
  else
    s.to_i <= 26 ? 1 : 0
  end
  puts "double s(#{s}) = #{res}"
  res
end

s = ARGV[0]

puts "s is #{s}"
puts "res is #{num_decodings(s)}"