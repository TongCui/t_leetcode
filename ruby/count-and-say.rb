#!/usr/bin/env ruby

# The count-and-say sequence is the sequence of integers with the first five terms as following:

# 1.     1
# 2.     11
# 3.     21
# 4.     1211
# 5.     111221
# 1 is read off as "one 1" or 11.
# 11 is read off as "two 1s" or 21.
# 21 is read off as "one 2, then one 1" or 1211.
# Given an integer n, generate the nth term of the count-and-say sequence.

# Note: Each term of the sequence of integers will be represented as a string.

# Example 1:

# Input: 1
# Output: "1"
# Example 2:

# Input: 4
# Output: "1211"

# @param {Integer} n
# @return {String}
def count_and_say(n)
  res = "1"
  2.upto(n) do |i|
    temp = ""
    last_char = res[0]
    last_char_count = 1
    1.upto(res.size - 1) do |j|
      if res[j] == last_char
        last_char_count += 1
      else
        temp << "#{last_char_count}#{last_char}"
        last_char = res[j]
        last_char_count = 1
      end
    end
    temp << "#{last_char_count}#{last_char}"
    res = temp
  end

  res
end


n = ARGV[0].to_i

puts "n#{n} res #{count_and_say(n)}"

