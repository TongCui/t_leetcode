#!/usr/bin/env ruby


# [
#   "((()))",
#   "(()())",
#   "(())()",
#   "()(())",
#   "()()()"
# ]

# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  res = Array.new(n) { [] }
  res[0] = [""]
  res[1] = ["()"]
  (2..n).each do |i|
    temp = []
    (0..(i-1)).each do |inside| 
      res[inside].product(res[i - 1 - inside]).each { |i, o| temp << "(#{i})#{o}" }
    end
    res[i] = temp.uniq
  end
  res[n]
end

puts generate_parenthesis(ARGV[0].to_i)


