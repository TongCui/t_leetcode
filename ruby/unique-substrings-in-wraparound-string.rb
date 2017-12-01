#!/usr/bin/env ruby

# Consider the string s to be the infinite wraparound string of "abcdefghijklmnopqrstuvwxyz", so s will look like this: "...zabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcd....".

# Now we have another string p. Your job is to find out how many unique non-empty substrings of p are present in s. In particular, your input is the string p and you need to output the number of different non-empty substrings of p in the string s.

# Note: p consists of only lowercase English letters and the size of p might be over 10000.

# Example 1:
# Input: "a"
# Output: 1

# Explanation: Only the substring "a" of string "a" is in the string s.
# Example 2:
# Input: "cac"
# Output: 2
# Explanation: There are two substrings "a", "c" of string "cac" in the string s.
# Example 3:
# Input: "zab"
# Output: 6
# Explanation: There are six substrings "z", "a", "b", "za", "ab", "zab" of string "zab" in the string s.


# @param {String} p
# @return {Integer}
require 'set'

def find_substring_in_wrapround_string(p)
  return 0 if p.nil? or p.empty?
  
  last_substrings = [p[-1]]
  res_substrings = Set.new last_substrings
  (p.size - 2).downto(0) do |idx|
    
    last_substrings = if (p[idx] == "z" and p[idx + 1] == "a") or (p[idx].ord + 1 == p[idx + 1].ord)
      [p[idx]] + last_substrings.map { |e| p[idx] + e }
    else 
      [p[idx]]
    end
    
    res_substrings += last_substrings
  end
  # puts "all substrings are #{res_substrings.to_a}"
  res_substrings.size
end


p = ARGV[0]

puts "p is #{p}"
puts "res is #{find_substring_in_wrapround_string(p)}"