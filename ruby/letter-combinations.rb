#!/usr/bin/env ruby

# 1(   ) 2(abc) 3(def)
# 4(ghi) 5(jkl) 6(mno)
# 7(pqrs) 8(tuv) 9(wxyz)

# @param {String} digits
# @return {String[]}


def letter_combinations(digits)
  return [] unless /^[2-9]+$/ =~ digits
  
  map = {
    2 => "abc",
    3 => "def",
    4 => "ghi",
    5 => "jkl",
    6 => "mno",
    7 => "pqrs",
    8 => "tuv",
    9 => "wxyz"
  }
  
  elements = digits.chars.map { |ch| map[ch.to_i].chars }
  res = elements.first
  elements[1, elements.size - 1].each do |element|
    res = res.product(element).map { |a, b| a + b }
    # puts "element is #{element}, res is #{res}"
  end
  res
end

puts "res is #{letter_combinations(ARGV.first)}"