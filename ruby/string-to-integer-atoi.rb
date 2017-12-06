#!/usr/bin/env ruby

# Implement atoi to convert a string to an integer.

# Hint: Carefully consider all possible input cases. If you want a challenge, please do not see below and ask yourself what are the possible input cases.

# Notes: It is intended for this problem to be specified vaguely (ie, no given input specs). You are responsible to gather all the input requirements up front.

INT_BIT = 32
INT_MAX = 2 ** (INT_BIT - 1) - 1
INT_MIN = - 2 ** (INT_BIT - 1)

# @param {String} str
# @return {Integer}
def my_atoi(str)
  idx = 0
  idx += 1 while str[idx] == " "
  
  numbers = %w{0 1 2 3 4 5 6 7 8 9}

  case str[idx]
  when "+"
    idx, positive = idx + 1, true
  when "-"
    idx, positive = idx + 1, false
  when /\d/
    positive = true
  else
    return 0
  end

  res = 0
  str[idx..-1].each_char do |char|
    puts "char is #{char}"
    return 0 if char == "+" or char == "-"
    if numbers.include? char
      res = res * 10 + numbers.index(char) 
    elsif char == "_"
      next
    else
      break
    end
  end

  positive ? [INT_MAX, res].min : [INT_MIN, -res].max

end

str = ARGV[0]

puts "res is #{my_atoi(str)}"