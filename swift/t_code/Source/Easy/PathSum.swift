//
//  PathSum.swift
//  t_code
//
//  Created by tcui on 10/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
 
     Given a binary tree and a sum, determine if the tree has a root-to-leaf path such that adding up all the values along the path equals the given sum.
 
     Note: A leaf is a node with no children.
 
     Example:
 
     Given the below binary tree and sum = 22,
 
     5
     / \
     4   8
     /   / \
     11  13  4
     /  \      \
     7    2      1
     return true, as there exist a root-to-leaf path 5->4->11->2 which sum is 22.
 
 */

class PathSum {
    
    class Solution {
        func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
            guard let root = root else {
                return false
            }
            
            if (root.left == nil && root.right == nil) && root.val == sum {
                return true
            } else {
                return hasPathSum(root.left, sum - root.val) || hasPathSum(root.right, sum - root.val)
            }
        }
    }
}
