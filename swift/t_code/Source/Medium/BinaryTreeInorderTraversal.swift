//
//  BinaryTreeInorderTraversal.swift
//  t_code
//
//  Created by Tong on 11/08/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
 Given a binary tree, return the inorder traversal of its nodes' values.
 
 Example:
 
 Input: [1,null,2,3]
 1
 \
 2
 /
 3
 
 Output: [1,3,2]
 Follow up: Recursive solution is trivial, could you do it iteratively?
 
 */

class BinaryTreeInorderTraversal {
    class Solution {
        func inorderTraversal(_ root: TreeNode?) -> [Int] {
            guard let root = root else {
                return []
            }
            
            var res = [Int]()
            var stack = [TreeNode]()
            var cur: TreeNode? = root
            
            while cur != nil || !stack.isEmpty {
                while cur != nil {
                    stack.append(cur!)
                    cur = cur?.left
                }
                
                cur = stack.removeLast()
                res.append(cur!.val)
                cur = cur?.right
            }
            
            return res
        }
    }
}
