#!/usr/bin/env ruby

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def three_sum_closest(nums, target)
  return 0 if nums.size < 3
  nums.sort!
  # puts "sorted nums is #{nums}"
  size = nums.size
  best_target = nums[0,3].inject(0, :+)
  (0..(size - 3)).each do |i1|
    i2 = i1 + 1
    i3 = size - 1
    while i2 < i3
      # puts "Going idx #{[i1, i2, i3]}"
      sum = nums[i1] + nums[i2] + nums[i3]
      if sum == target 
        return target
      elsif sum < target 
        i2 += 1
      else
        i3 -= 1
      end

      if (sum - target).abs < (best_target - target).abs
        best_target = sum
      end

    end
  end

  best_target
end

puts "#{ARGV}"
puts "res is #{three_sum_closest(ARGV.first[1..-2].split(",").map{|x| x.to_i}, ARGV.last.to_i)}"