//
//  ConvertSortedArraytoBinarySearchTree.swift
//  t_code
//
//  Created by tcui on 10/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
     Given an array where elements are sorted in ascending order, convert it to a height balanced BST.
 
     For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
 
     Example:
 
     Given the sorted array: [-10,-3,0,5,9],
 
     One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:
 
     0
     / \
     -3   9
     /   /
     -10  5
 
 */

class ConvertSortedArraytoBinarySearchTree {
    class Solution {
        func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
            return sortedArrayToBST(nums, from: 0, to: nums.count - 1)
        }
        
        func sortedArrayToBST(_ nums: [Int], from: Int, to: Int) -> TreeNode? {
            guard nums.count > 0 && from <= to else {
                return nil
            }
            
            let mid = from + (to - from) / 2
            let node = TreeNode(nums[mid])
            node.left = sortedArrayToBST(nums, from: from, to: mid - 1)
            node.right = sortedArrayToBST(nums, from: mid + 1, to: to)
            
            return node
        }
        
        func sortedArrayToBST1(_ nums: [Int]) -> TreeNode? {
            guard !nums.isEmpty else {
                return nil
            }
            
            let mid = nums.count / 2
            let node = TreeNode(nums[mid])
            node.left = sortedArrayToBST1(Array(nums.prefix(upTo: mid)))
            node.right = sortedArrayToBST1(Array(nums.suffix(from: mid + 1)))
            return node
        }
    }
}
