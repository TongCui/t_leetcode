#!/usr/bin/env ruby

INT_BIT = 32
INT_MAX = 2 ** (INT_BIT - 1) - 1
INT_MIN = -2 ** (INT_BIT - 1)

# @param {Integer} dividend
# @param {Integer} divisor
# @return {Integer}
def divide(dividend, divisor)
  positive = true if (dividend > 0 and divisor > 0) or (dividend < 0 and divisor < 0)
  dividend, divisor = dividend.abs, divisor.abs

  shift = Array.new(INT_BIT) { |i| divisor << i }
  quotient = 0
  shift.to_enum.with_index.reverse_each do |n, i|
    case dividend <=> n
    when 1
      quotient += 2 ** i 
      dividend -= n
    when 0
      quotient += 2 ** i
      break
    end
  end

  positive ? [quotient, INT_MAX].min : [-quotient, INT_MIN].max

end

dividend, divisor = ARGV.map{|x| x.to_i}

puts "Divide #{dividend} by #{divisor} is #{divide(dividend, divisor)}"
