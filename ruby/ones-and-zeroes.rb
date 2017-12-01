#!/usr/bin/env ruby
# In the computer world, use restricted resource you have to generate maximum benefit is what we always want to pursue.

# For now, suppose you are a dominator of m 0s and n 1s respectively. On the other hand, there is an array with strings consisting of only 0s and 1s.

# Now your task is to find the maximum number of strings that you can form with given m 0s and n 1s. Each 0 and 1 can be used at most once.

# Note:
# The given numbers of 0s and 1s will both not exceed 100
# The size of given string array won't exceed 600.
# Example 1:
# Input: Array = {"10", "0001", "111001", "1", "0"}, m = 5, n = 3
# Output: 4

# Explanation: This are totally 4 strings can be formed by the using of 5 0s and 3 1s, which are “10,”0001”,”1”,”0”
# Example 2:
# Input: Array = {"10", "0", "1"}, m = 1, n = 1
# Output: 2

# Explanation: You could form "10", but then you'd have nothing left. Better form "0" and "1".

# @param {String[]} strs
# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def find_max_form(strs, m, n)
  return 0 if strs.nil? or strs.empty? or (m == 0 and n == 0)
  # strs.sort!{|a, b| [a.size, a] <=> [b.size, b]}
  mncounts = strs.map { |str|  mncount(str) }
  res = 0
  book = {}
  0.upto(strs.size - 1) { |i| res = [res, find_max_start_from_mncounts(mncounts, i, m, n, book) ].max }
  res
end

def find_max_start_from_mncounts(mncounts, from, m, n, book)
  key = "#{from}-#{m}-#{n}" 
  # puts "Going key #{key}"
  return book[key] if book.include? key

  from_m, from_n = mncounts[from]
  res = 0
  if from_m <= m and from_n <= n
      res = 1
      (from + 1).upto(mncounts.size - 1) do |idx|
      temp_m, temp_n = mncounts[idx]
      temp = find_max_start_from_mncounts(mncounts, idx, m - from_m, n - from_n, book)
      res = [res, temp + 1].max if temp > 0
    end
  end
  # puts "mncounts #{mncounts} [from, m, n] #{[from, m, n]} res is #{res}"
  book[key] = res
  res
end

def mncount(str)
  m, n = 0, 0
  str.each_char do |ch|
    case ch
    when "0"; m += 1
    when "1"; n += 1
    end
  end
  [m, n]
end

# ["10","0001","111001","1","0"]

# [[1, 1], [3, 1], [2, 4], [0, 1], [1, 0]]
# 3 4 


strs = ARGV[0][1...-1].split(",")
m = ARGV[1].to_i
n = ARGV[2].to_i

puts "strs #{strs} m, n #{[m,n]}"
puts "res is #{find_max_form(strs, m, n)}"