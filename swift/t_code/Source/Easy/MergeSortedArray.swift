//
//  MergeSortedArray.swift
//  t_code
//
//  Created by tcui on 10/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
 
     Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.
 
     Note:
 
     The number of elements initialized in nums1 and nums2 are m and n respectively.
     You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2.
     Example:
 
     Input:
     nums1 = [1,2,3,0,0,0], m = 3
     nums2 = [2,5,6],       n = 3
 
     Output: [1,2,2,3,5,6]
 
 */

class MergeSortedArray {
    class Solution {
        func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
            var idx1 = m - 1
            var idx2 = n - 1
            
            while idx1 >= 0 || idx2 >= 0 {
                let idx = idx1 + 1 + idx2
                if idx1 >= 0 && idx2 >= 0 {
                    if nums1[idx1] > nums2[idx2] {
                        nums1[idx] = nums1[idx1]
                        idx1 -= 1
                    } else {
                        nums1[idx] = nums2[idx2]
                        idx2 -= 1
                    }
                } else if idx1 >= 0 {
                    nums1[idx] = nums1[idx1]
                    idx1 -= 1
                } else {
                    nums1[idx] = nums2[idx2]
                    idx2 -= 1
                }
            }
        }
    }
}
