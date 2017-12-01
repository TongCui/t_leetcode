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

def find_substring_in_wrapround_string(p)
  return 0 if p.nil? or p.empty?
  
  dp = Hash.new { |hash, key| hash[key] = 0 }
  dp[p[0]] = 1
  lo = 0
  1.upto(p.size - 1) do |hi|
    char = p[hi]
    if (p[hi].ord - p[hi - 1].ord) % 26 == 1
      dp[char] = [dp[char], hi + 1 - lo].max
    else
      dp[char] = [dp[char], 1].max
      lo = hi
    end
  end
  
  # puts "dp is #{dp}"
  dp.values.reduce(0, :+)
end


p = ARGV[0]

puts "p is #{p}"
puts "res is #{find_substring_in_wrapround_string(p)}"