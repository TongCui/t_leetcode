//
//  MinimumDepthofBinaryTree.swift
//  t_code
//
//  Created by tcui on 11/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
     Given a binary tree, find its minimum depth.
 
     The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.
 
     Note: A leaf is a node with no children.
 
     Example:
 
     Given binary tree [3,9,20,null,null,15,7],
 
     3
     / \
     9  20
     /  \
     15   7
     return its minimum depth = 2.
 
 */

class MinimumDepthofBinaryTree {
    class Solution {
        func minDepth(_ root: TreeNode?) -> Int {
            guard let root = root else {
                return 0
            }
            
            let left = minDepth(root.left)
            let right = minDepth(root.right)
            
            if left == 0 && right == 0 {
                return 1
            } else if left == 0 {
                return right + 1
            } else if right == 0 {
                return left + 1
            } else {
                return min(left, right) + 1
            }
        }
        
        func minDepth1(_ root: TreeNode?) -> Int {
            guard let root = root else {
                return 0
            }
            
            guard root.left != nil || root.right != nil else {
                return 1
            }
            
            var nodes = [root]
            var depth = 0
            var tillEnd = false
            
            while !tillEnd {
                var temp = [TreeNode]()
                for node in nodes {
                    if node.left == nil && node.right == nil {
                        tillEnd = true
                        break
                    }
                    
                    if let left = node.left {
                        temp.append(left)
                    }
                    
                    if let right = node.right {
                        temp.append(right)
                    }
                }
                depth += 1
                nodes = temp
            }
            
            return depth
        }
    }
}
