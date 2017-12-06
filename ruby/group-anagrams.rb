#!/usr/bin/env ruby

# Given an array of strings, group anagrams together.

# For example, given: ["eat", "tea", "tan", "ate", "nat", "bat"], 
# Return:

# [
#   ["ate", "eat","tea"],
#   ["nat","tan"],
#   ["bat"]
# ]
# Note: All inputs will be in lower-case.

# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  map = Hash.new { |hash, key| hash[key] = [] }
  strs.each do |str|
    key = str.chars.sort.join("")
    map[key] << str
  end 
  map.map { |key, value| value  }
end