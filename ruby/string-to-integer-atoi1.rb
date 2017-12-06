#!/usr/bin/env ruby

# Implement atoi to convert a string to an integer.

# Hint: Carefully consider all possible input cases. If you want a challenge, please do not see below and ask yourself what are the possible input cases.

# Notes: It is intended for this problem to be specified vaguely (ie, no given input specs). You are responsible to gather all the input requirements up front.

def my_atoi(str)
    i = 0
    i += 1 while(str[i] == ' ')
    ans = 0
    positive = true
        
    if(str[i] == '+' || str[i] == '-')
        positive = false if str[i] == '-'
        i += 1
    end
    while(i < str.length && str[i].ord >= 48 && str[i].ord <= 57)
        ans = ans * 10 + str[i].to_i
        i += 1
    end
    if(positive)
        ans = [2147483647,ans].min
    else
        ans *= -1
        ans = [-2147483648,ans].max        
    end
    
    
    ans
end

str = ARGV[0]

puts "res is #{my_atoi(str)}"