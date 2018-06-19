//
//  SymmetricTree.swift
//  t_code
//
//  Created by tcui on 10/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
     Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
 
     For example, this binary tree [1,2,2,3,4,4,3] is symmetric:
 
     1
     / \
     2   2
     / \ / \
     3  4 4  3
     But the following [1,2,2,null,3,null,3] is not:
     1
     / \
     2   2
     \   \
     3    3
     Note:
     Bonus points if you could solve it both recursively and iteratively.
 
 */

class SymmetricTree {
    
    class Solution {
        func isSymmetric(_ root: TreeNode?) -> Bool {
            if root == nil { return true }
            if root?.left == nil && root?.right == nil { return true }
            if root?.left == nil || root?.right == nil { return false }
            
            if let left = root?.left, let right = root?.right {
                if left.val == right.val {
                    let temp = left.right
                    left.right = right.right
                    right.right = temp
                    return isSymmetric(left) && isSymmetric(right)
                } else {
                    return false
                }
            }
            
            return false
        }
        
        func isSymmetric1(_ root: TreeNode?) -> Bool {
            if let root = root {
                return isMirror(root.left, root.right)
            } else {
                return true
            }
        }
        
        func isMirror(_ lhs: TreeNode?, _ rhs: TreeNode?) -> Bool {
            if let lhs = lhs, let rhs = rhs {
                if lhs.val == rhs.val {
                    return isMirror(lhs.left, rhs.right) && isMirror(lhs.right, rhs.left)
                } else {
                    return false
                }
            } else if lhs == nil && rhs == nil {
                return true
            } else {
                return false
            }
        }
        
        
    }
}
