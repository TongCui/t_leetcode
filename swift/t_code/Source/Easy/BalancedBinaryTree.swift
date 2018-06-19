//
//  BalancedBinaryTree.swift
//  t_code
//
//  Created by tcui on 11/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
 
     Given a binary tree, determine if it is height-balanced.
     
     For this problem, a height-balanced binary tree is defined as:
     
     a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
     
     Example 1:
     
     Given the following tree [3,9,20,null,null,15,7]:
     
     3
     / \
     9  20
     /  \
     15   7
     Return true.
     
     Example 2:
     
     Given the following tree [1,2,2,3,3,null,null,4,4]:
     
     1
     / \
     2   2
     / \
     3   3
     / \
     4   4
     Return false.
 */

class BalancedBinaryTree {
    class Solution {
        
        func isBalanced(_ root: TreeNode?) -> Bool {
            guard let root = root else {
                return true
            }
            
            let leftDepth = maxDepth(root.left)
            let rightDepth = maxDepth(root.right)
            return abs(leftDepth - rightDepth) <= 1 && isBalanced(root.left) && isBalanced(root.right)
        }
        
        func maxDepth(_ root: TreeNode?) -> Int {
            if let root = root {
                return 1 + max(maxDepth(root.left), maxDepth(root.right))
            } else {
                return 0
            }
        }
        
        func isBalanced1(_ root: TreeNode?) -> Bool {
            return treeHeight(root) != -1
        }
        
        func treeHeight(_ root: TreeNode?) -> Int {
            guard let root = root else {
                return 0
            }
            
            let leftHeight = treeHeight(root.left)
            let rightHeight = treeHeight(root.right)
            
            if leftHeight == -1 || rightHeight == -1 || abs(leftHeight - rightHeight) > 1 {
                return  -1
            } else {
                return max(leftHeight, rightHeight) + 1
            }
        }
        
    }
}
