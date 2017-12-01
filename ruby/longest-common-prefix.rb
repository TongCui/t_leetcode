#!/usr/bin/env ruby

def longest_common_prefix(strs)
    return "" if strs.empty?
    
    first_str = strs.first
    end_idx = nil

    first_str.chars.each_with_index do |char, idx|
      all_equal_char = true
      (1...strs.size).each do |word_idx|
        if strs[word_idx][idx] != char
          all_equal_char = false
          break
        end
      end

      break unless all_equal_char
        
      end_idx = idx
    end

    if end_idx.nil?
      ""
    else 
      first_str[0..end_idx]
    end
end

inputs = []
expects = []

inputs.push []
expects.push nil

inputs.push ["abc", ""]
expects.push ""

inputs.push ["abc", "abbb", "abd"]
expects.push "ab"

inputs.push ["abcdefgasfasfasdf", "abcdefg1enmn1e,ma,m", "abcdefg asf1fasf"]
expects.push "abcdefg"

inputs.zip(expects).each do |input, expect|
  puts "========"
  puts "input - #{input}"
  res = longest_common_prefix(input)
  puts "Result (#{res == expect ? 'Success' : 'Failed'})"
  puts "Res : #{res}"
  puts "Expect : #{expect}"
end