#!/usr/bin/env ruby

# Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2.

# Note:

# The length of both num1 and num2 is < 110.
# Both num1 and num2 contains only digits 0-9.
# Both num1 and num2 does not contain any leading zero.
# You must not use any built-in BigInteger library or convert the inputs to integer directly.

# @param {String} num1
# @param {String} num2
# @return {String}
def multiply(num1, num2)
  num1, num2 = num1.size > num2.size ? [num1.chars.map{|x|x.to_i}, num2.chars.map{|x|x.to_i}] : [num2.chars.map{|x|x.to_i}, num1.chars.map{|x|x.to_i}]
  # puts "nums #{[num1, num2]}"
  res = [0]
  (num2.size - 1).downto(0) do |i|
    next if num2[i] == 0
    res = add(multiply_digit(num1.clone, num2[i]) + [0] * (num2.size - 1 - i), res)
  end
  res.join("")
end

def multiply_digit(num1, digit)
  puts "num1 #{num1} x digit #{digit}"
  pre = 0
  (num1.size - 1).downto(0) do |idx|
    pre, num1[idx] = (pre + digit * num1[idx]).divmod(10) 
  end
  num1.unshift(pre) if pre > 0
  num1
end

def add(num1, num2)
  # puts "num1 #{num1} + num2 #{num2}"
  pre = 0
  (num1.size - 1).downto(0) do |idx|
    idx2 = num2.size - (num1.size - idx)
    a2 = idx2 >= 0 ? num2[idx2] : 0
    pre, num1[idx] = (pre + num1[idx] + a2).divmod(10)
  end
  num1.unshift(pre) if pre > 0
  num1
end

num1 = ARGV[0]
num2 = ARGV[1]
puts "num1, num2 = #{[num1, num2]}"
puts "res #{multiply(num1, num2)}"
