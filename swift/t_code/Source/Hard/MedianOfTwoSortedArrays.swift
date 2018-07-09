//
//  MedianOfTwoSortedArrays.swift
//  t_code
//
//  Created by Tong on 07/07/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
 
 There are two sorted arrays nums1 and nums2 of size m and n respectively.
 
 Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 
 Example 1:
 nums1 = [1, 3]
 nums2 = [2]
 
 The median is 2.0
 Example 2:
 nums1 = [1, 2]
 nums2 = [3, 4]
 
 The median is (2 + 3)/2 = 2.5

 
 */

class MedianOfTwoSortedArrays {
    class Solution {
        func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
            let totalCount = nums1.count + nums2.count
            var nums = [Int](repeating: 0, count: totalCount)
            
            
            var i = 0, j = 0, k = 0
            
            while i < nums1.count && j < nums2.count {
                if nums1[i] <= nums2[j] {
                    nums[k] = nums1[i]
                    i += 1
                } else {
                    nums[k] = nums2[j]
                    j += 1
                }
                k += 1
            }
            
            if i < nums1.count {
                nums.replaceSubrange(k..<totalCount, with: nums1[i..<nums1.count])
            }
            
            if j < nums2.count {
                nums.replaceSubrange(k..<totalCount, with: nums2[j..<nums2.count])
            }
            
            return medianFromArray(nums)
        }
        
        func medianFromArray(_ array:[Int]) -> Double {
            guard !array.isEmpty else {
                return 0
            }
            
            if array.count % 2 == 0 {
                let idx = array.count / 2
                return Double(array[idx] + array[idx - 1]) / 2.0
            } else {
                return Double(array[array.count / 2])
            }
        }
    }
}


