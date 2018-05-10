//
//  BinaryTreeLevelOrderTraversalII.swift
//  t_code
//
//  Created by tcui on 10/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
    Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).

    For example:
    Given binary tree [3,9,20,null,null,15,7],
    3
    / \
    9  20
    /  \
    15   7
    return its bottom-up level order traversal as:
    [
    [15,7],
    [9,20],
    [3]
    ]
 
 */

class BinaryTreeLevelOrderTraversalII {
    class Solution {
        func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
            guard let root = root else {
                return []
            }

            var left = levelOrderBottom(root.left)
            var right = levelOrderBottom(root.right)

            let diff: [[Int]] = Array(repeating: [], count: abs(left.count - right.count))
            
            
            if left.count > right.count {
                right = diff + right
            } else {
                left = diff + left
            }
            
            let res = zip(left, right).map { (lhs, rhs) in
                lhs + rhs
            }
            
            return res + [[root.val]]
        }
        
        func levelOrderBottom1(_ root: TreeNode?) -> [[Int]] {
            var result = [[Int]]()
            fullFillTreeVals(root, values: &result, level: 1)
            return result.reversed()
        }
        
        func fullFillTreeVals(_ root: TreeNode?, values: inout [[Int]], level: Int) {
            guard let root = root else {
                return
            }
            
            while values.count < level {
                values.append([])
            }
            
            values[level - 1].append(root.val)
            fullFillTreeVals(root.left, values: &values, level: level + 1)
            fullFillTreeVals(root.right, values: &values, level: level + 1)
        }
    }
}
