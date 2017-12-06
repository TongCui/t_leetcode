#!/usr/bin/env ruby

# There are two sorted arrays nums1 and nums2 of size m and n respectively.

# Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).

# Example 1:
# nums1 = [1, 3]
# nums2 = [2]

# The median is 2.0
# Example 2:
# nums1 = [1, 2]
# nums2 = [3, 4]

# The median is (2 + 3)/2 = 2.5

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  nums1, nums2 = nums2, nums1 if nums1.size > nums2.size 
  if nums1[-1] <= nums2[0]
    return nums1.size == nums2.size ? median_of_array([nums1[-1], nums2[0]]) : median_of_array(nums2[0...-(nums1.size)]) 
  elsif nums1[0] >= nums2[-1]
    return nums1.size == nums2.size ? median_of_array([nums1[0], nums2[-1]]) : median_of_array(nums2[nums1.size..-1]) if nums1[0] >= nums2[-1]
  else
    median1 = median_of_array(nums1)
    median2 = median_of_array(nums2)
    if median1 == median2
      return median1
    elsif median1 < median2      
      return find_median_sorted_arrays()
    else
      
    end
  end
    
end


def half_of_array(nums, left)
  return nil if nums.empty?
  return nums[0] if nums.size == 1
  div, mod = nums.size.divmod 2

end

def median_of_array(nums)
  return nil if nums.empty?
  return nums[0] if nums.size == 1
  div, mod = nums.size.divmod 2
  if mod == 0
    (nums[div] + nums[div - 1]) / 2.0
  else
    nums[div]
  end
end



