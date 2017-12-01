#!/usr/bin/env ruby

# Given a set of candidate numbers (C) (without duplicates) and a target number (T), find all unique combinations in C where the candidate numbers sums to T.

# The same repeated number may be chosen from C unlimited number of times.

# Note:
# All numbers (including target) will be positive integers.
# The solution set must not contain duplicate combinations.
# For example, given candidate set [2, 3, 6, 7] and target 7, 
# A solution set is: 
# [
#   [7],
#   [2, 2, 3]
# ]

# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum(candidates, target)
  return [] if candidates.nil? or candidates.empty?
  candidates.sort!
  puts "sorted candidates are #{candidates}"
  _combination_sum(candidates, target)
end

def _combination_sum(candidates, target)
  return [] if candidates.empty?
  
  candidates_size = candidates.size
  res = []
  candidates.each_with_index do |number, idx|
    break if number > target
    next if idx < candidates_size - 1 and candidates[idx + 1] == number
    div = target / number
    1.upto(div) do |number_count|  
      if number_count * number == target
        res << Array.new(number_count, number)
      elsif idx < candidates_size - 1
        temp = _combination_sum(candidates[(idx + 1)..-1], target - number_count * number)
        temp.each {|r| res << Array.new(number_count, number) + r}
      end
    end
  end
  
  # puts "candidates #{candidates} with target #{target}, res #{res}"
  res
end


nums = ARGV[0][1...-1].split(",").map{|x| x.to_i }
target = ARGV[1].to_i

puts "nums are #{nums}, target is #{target}"
puts "res is #{combination_sum(nums, target)}"
