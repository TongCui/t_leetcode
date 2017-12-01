#!/usr/bin/env ruby

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[][]}

def four_sum(nums, target)
  size = nums.size

  return [] if size < 4
  res = []
  nums.sort!
  puts "Sorted nums is #{nums}"
  i1 = 0
  while i1 <= size - 4
    a1 = nums[i1]
    i2 = i1 + 1
    while i2 <= size - 3 
      a2 = nums[i2]
      i3 = i2 + 1
      i4 = size - 1
      sum = target - a1 - a2
      while i3 < i4
        if nums[i3] + nums[i4] == sum 
          # puts "Found (#{[i1, i2, i3, i4]}) with #{[a1, a2, nums[i3], nums[i4]]}"
          res << [a1, a2, nums[i3], nums[i4]]

          while i3 < i4 and nums[i3] == nums[i3 + 1]
            i3 += 1
          end

          while i3 < i4 and nums[i4] == nums[i4 - 1]
            i4 -= 1
          end

          i3 += 1
          i4 -= 1
        elsif nums[i3] + nums[i4] < sum 
          i3 += 1
        else
          i4 -= 1
        end
      end

      while i2 <= size - 3 and nums[i2] == nums[i2 + 1]
        i2 += 1
      end

      i2 += 1
    end

    while i1 <= size - 4 and nums[i1] == nums[i1 + 1]
      i1 += 1
    end

    i1 += 1
  end

  res
end



inputs0 = []
inputs1 = []
expects = []

# inputs0.push [-1, 0, 1, 1, 2, -1, -4]
# inputs1.push 0
# expects.push [[-4, 1, 1, 2], [-1, -1, 0, 2], [-1, -1, 1, 1]]

# inputs0.push [-1, 0, 1, 1, 2, -1, -4]
# inputs1.push 2
# expects.push [[-4, 1, 1, 2], [-1, -1, 0, 2], [-1, -1, 1, 1]]

inputs0.push [0,8,2,-9,-14,5,2,-5,-5,-9,-1,3,1,-8,0,-3,-12,2,11,9,13,-14,2,-15,4,10,9,7,14,-8,-2,-1,-15,-15,-2,8,-3,7,-12,8,6,2,-12,-8,1,-4,-3,5,13,-7,-1,11,-13,8,4,6,3,-2,-2,3,-2,3,9,-10,-4,-8,14,8,7,9,1,-2,-3,5,5,5,8,9,-5,6,-12,1,-5,12,-6,14,3,5,-11,8,-7,2,-12,9,8,-1,9,-1,-7,1,-7,1,14,-3,13,-4,-12,6,-9,-10,-10,-14,7,0,13,8,-9,1,-2,-5,-14]
inputs1.push 0
expects.push []

expects.zip(inputs0, inputs1).each do |expect, input0, input1|
  puts "========"
  res = four_sum(input0, input1)
  puts "Result (#{res == expect ? 'Success' : 'Failed'})"
  puts "Res : #{res}"
  puts "Expect : #{expect}"
end
