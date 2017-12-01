#!/usr/bin/env ruby

# Given a collection of candidate numbers (C) and a target number (T), find all unique combinations in C where the candidate numbers sums to T.

# Each number in C may only be used once in the combination.

# Note:
# All numbers (including target) will be positive integers.
# The solution set must not contain duplicate combinations.
# For example, given candidate set [10, 1, 2, 7, 6, 1, 5] and target 8, 
# A solution set is: 
# [
#   [1, 7],
#   [1, 2, 5],
#   [2, 6],
#   [1, 1, 6]
# ]

# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum2(candidates, target)
  return [] if candidates.nil? or candidates.empty?
  candidates.sort!
  # puts "sorted candidates are #{candidates}"
  res = []
  candidates.each_with_index do |candidate, idx|
    next if idx > 0 and candidate == candidates[idx - 1]
    break if candidate > target
    _combination_sum2(candidates, candidate, idx, target).each {|x| puts("candidate, idx #{[candidate, idx]}) x is #{x}");res << x}
  end
  res
end

def _combination_sum2(candidates, candidate, from, target)
  # puts "!!!from #{from} target #{target}"
  case candidate <=> target
  when 0
    return [[candidate]]
  when 1
    return []
  when -1
    res = []
    
    sub_target = target - candidate
    (from + 1).upto(candidates.size - 1) do |i|
      next if i != from + 1 and candidates[i] == candidates[i - 1]
      break if candidates[i] > sub_target
      _combination_sum2(candidates, candidates[i], i, sub_target).each {|x| res << ([candidate] + x)}
    end

    # puts "from #{from}) candidate(#{candidate}), target(#{target}) - res #{res}"

    return res
  end
end

nums = ARGV[0][1...-1].split(",").map{|x| x.to_i }
target = ARGV[1].to_i

puts "nums are #{nums}, target is #{target}"
puts "res is #{combination_sum2(nums, target)}"